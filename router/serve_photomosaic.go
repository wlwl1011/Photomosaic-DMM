package router

import (
	"errors"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
	"photomosaic_dmm/common"

	"github.com/gin-gonic/gin"
)

func postPhotomosaic(c *gin.Context) {
	defer handleError(c)

	form, _ := c.MultipartForm()
	log.Println("upload file")
	file := form.File["files"][0]

	reader, err := file.Open()
	if err != nil {
		panic(err)
	}

	pid := common.GeneratePID("picture", filepath.Ext(file.Filename))
	err = db.Upload("tmpuid", pid, reader, file.Size)
	if err != nil {
		panic(err)
	}

	reader.Seek(0, 0)
	err = makePhotomosaic(pid, "red", reader)
	if err != nil {
		panic(err)
	}

	c.String(http.StatusCreated, pid[7:])
}

// save photomosaic picture
func putPhotomosaic(c *gin.Context) {
	defer handleError(c)

	print("^^")
	body := map[string]interface{}{}

	err := c.BindJSON(&body)
	if err != nil {
		panic(err)
	}

	pid, ok := body["pid"].(string)
	if !ok {
		panic(errors.New("request should include pid"))
	}

	uid, ok := body["uid"].(string)
	if !ok {
		panic(errors.New("request should include uid"))
	}

	err = db.Save(uid, pid)
	if err != nil {
		panic(err)
	}
}

func makePhotomosaic(pid, theme string, reader io.Reader) error {
	defer func() {
		// 파일 삭제
		os.Remove("./photomosaic/" + pid)
		os.Remove("./photomosaic/photomosaic-" + pid[7:])
	}()

	_, err := os.Stat("./photomosaic")
	if err != nil {
		if !os.IsNotExist(err) {
			return err
		}

		os.Mkdir("./photomosaic", 0775)
	}

	f, err := os.Create("./photomosaic/" + pid)
	if err != nil {
		fmt.Println(err)
		return err
	}

	_, err = io.Copy(f, reader)
	if err != nil {
		return err
	}

	f.Close()

	// run photomosaic program
	pool := "./image_pool/" + theme
	input := "./photomosaic/" + pid
	output := "./photomosaic/photomosaic-" + pid[7:]

	_, err = exec.Command("python", "photomosaic.py", "--pool", pool, "--input", input, "--output", output).Output()
	if err != nil {
		fmt.Println(err)
		return err
	}

	f, err = os.Open("./photomosaic/photomosaic-" + pid[7:])
	if err != nil {
		return err
	}
	defer f.Close()
	info, _ := f.Stat()

	err = db.Upload("tmpuid", "photomosaic-"+pid[7:], f, info.Size())
	if err != nil {
		return err
	}
	return nil

}
