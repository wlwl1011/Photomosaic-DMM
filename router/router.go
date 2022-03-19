package router

import (
	"photomosaic_dmm/model"
	"strings"

	"github.com/gin-gonic/gin"
)

var db model.DBHandler

func init() {
	var err error
	db, err = model.NewPostgresqlHandler()
	if err != nil {
		panic(err)
	}
}

func NewRouter() *gin.Engine {
	apiEngine := gin.New()
	apiv1 := apiEngine.Group("api/v1")
	{
		apiv1.POST("/upload", postPicture)
		apiv1.GET("/objectList", getList)
		apiv1.GET("/object", getPicture)
	}

	r := gin.New()

	assetEngine := gin.New()
	assetEngine.Static("/", "./static")
	r.Any("/*any", func(c *gin.Context) {
		path := c.Param("any")
		if strings.HasPrefix(path, "/api") {
			apiEngine.HandleContext(c)
		} else {
			assetEngine.HandleContext(c)
		}
	})

	return r
}
