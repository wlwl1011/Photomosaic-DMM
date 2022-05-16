package router

import (
	"io"
	"log"
	"os"
	"path/filepath"
	"photomosaic_dmm/common"

	"github.com/gin-gonic/gin"
)

func postPhotomosic(c *gin.Context) {
	defer handleError(c)

	form, _ := c.MultipartForm()
	log.Println("upload file")
	files := form.File["files"]

	for _, file := range files {
		reader, err := file.Open()
		if err != nil {
			panic(err)
		}

		pid := common.GeneratePID("picture", filepath.Ext(file.Filename))
		err = db.Upload("tmpuid", pid, reader, file.Size)
		if err != nil {
			panic(err)
		}

		makePhotomosaic("photomosaic"+pid[7:], reader)
	}

}

func makePhotomosaic(pid string, reader io.Reader) error {
	defer func() {
		// 파일 삭제

	}()

	_, err := os.Stat("./photomosaic")
	if err != nil {
		if !os.IsNotExist(err) {
			return err
		}

		os.Mkdir("./photomosaic", 0666)
	}

	f, err := os.Create("./photomosaic/" + pid)
	if err != nil {
		return err
	}

	defer f.Close()

	_, err = io.Copy(f, reader)
	if err != nil {
		return err
	}

	// run photomosaic program
	return nil

}
