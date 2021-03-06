package router

import (
	"errors"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"path/filepath"
	"photomosaic_dmm/common"

	"github.com/gin-gonic/gin"
)

func postPicture(c *gin.Context) {
	defer handleError(c)
	form, _ := c.MultipartForm()
	log.Println("upload file")
	files := form.File["files"]
	log.Println(len(files))
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
		// c.SaveUploadedFile(file, dst)
	}

	c.String(http.StatusOK, fmt.Sprintf("%d files uploaded!!", len(files)))
}

func getList(c *gin.Context) {
	defer handleError(c)

	uid, b := c.GetQuery("uid")
	if !b {
		c.Status(http.StatusBadRequest)
		panic(errors.New("request should include uid"))
	}

	log.Println(uid)

	list, err := db.RetrieveList(uid)
	if err != nil {
		panic(err)
	}

	c.JSON(http.StatusOK, list)
}

// func deletePicture(c *gin.Context) {

// }
func getPicture(c *gin.Context) {
	defer handleError(c)
	uid, b := c.GetQuery("uid")
	if !b {
		c.Status(http.StatusBadRequest)
		panic(errors.New("request should include uid"))
	}

	log.Println(uid)

	pid, b := c.GetQuery("pid")
	if !b {
		c.Status(http.StatusBadRequest)
		panic(errors.New("request should include pid"))
	}

	reader, err := db.GetObject(fmt.Sprintf("%s/%s", uid, pid))
	if err != nil {
		panic(err)
	}

	img, err := ioutil.ReadAll(reader)
	if err != nil {
		panic(err)
	}

	c.Data(http.StatusOK, "application/octet-stream", img)
}

func deletePicture(c *gin.Context) {
	defer handleError(c)
	uid := c.GetHeader("uid")
	// fmt.Println(uid)
	if len(uid) == 0 {
		// c.Status(http.StatusOK)
		uid = "tmpuid"
		// return
	}

	pid, b := c.GetQuery("pid")
	if !b {
		c.Status(http.StatusBadRequest)
		panic(errors.New("request should include pid"))
	}

	err := db.Delete(uid, pid)
	if err != nil {
		panic(err)
	}

	c.String(http.StatusOK, "Deleted")
}
