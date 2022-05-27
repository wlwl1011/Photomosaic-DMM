package router

import (
	"net/http"
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
		apiv1.GET("/.well-known", func(c *gin.Context) {
			c.String(http.StatusOK, "Hello")
		})
		//삭제
		apiv1.DELETE("/delete", deletePicture)
		//저장된 photomosaic 파일 List로 불러오기
		apiv1.GET("/objectList", getList)
		//minio로 부터 object 파일 수신 후, flutter로 전송
		apiv1.GET("/object", getPicture)
		//photomosaic 생성
		apiv1.POST("/photomosaic/create", postPhotomosaic)
		//photomosaic으로 만들어진 것을 저장
		apiv1.PUT("/photomosaic/save", putPhotomosaic)
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
