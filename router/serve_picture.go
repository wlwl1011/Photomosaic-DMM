package router

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"path/filepath"

	"github.com/gin-gonic/gin"
)

func postPicture(c *gin.Context) {
	form, _ := c.MultipartForm()
	log.Println("upload file")
	files := form.File["files"]
	log.Println(len(files))
	for _, file := range files {
		reader, err := file.Open()
		if err != nil {
			c.Status(http.StatusBadRequest)
		}

		db.Upload("tmpuid", filepath.Ext(file.Filename), reader, file.Size)
		// c.SaveUploadedFile(file, dst)
	}

	c.String(http.StatusOK, fmt.Sprintf("%d files uploaded!!", len(files)))
}

func deletePicture(c *gin.Context) {

	form, _ := c.MultipartForm()
	log.Println("delete file")
	files := form.File["files"]
	log.Println(len(files))

	pid, b := c.GetQuery("pid")
	if !b {
		c.Status(http.StatusBadRequest)
		return
	}

	for _, file := range files {
		reader, err := file.Open()
		if err != nil {
			c.Status(http.StatusBadRequest)
		}

		db.Delete("tmpuid", pid, reader, file.Size)
		// c.SaveUploadedFile(file, dst)
	}

	c.String(http.StatusOK, fmt.Sprintf("%d files deleted!!", len(files)))
}

func getList(c *gin.Context) {
	uid := c.GetHeader("uid")
	if len(uid) == 0 {
		c.Status(http.StatusOK)
		return
	}

	list, err := db.RetrieveList(uid)
	if err != nil {
		c.Status(http.StatusBadRequest)
		return
	}

	c.JSON(http.StatusOK, list)
}

// func deletePicture(c *gin.Context) {

// }
func getPicture(c *gin.Context) {
	// fmt.Println("^^")
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
		return
	}

	reader, err := db.GetObject(fmt.Sprintf("%s/%s", uid, pid))
	if err != nil {
		c.Status(http.StatusBadRequest)
		return
	}

	img, err := ioutil.ReadAll(reader)
	if err != nil {
		c.Status(http.StatusBadRequest)
		return
	}

	c.Data(http.StatusOK, "application/octet-stream", img)
}
