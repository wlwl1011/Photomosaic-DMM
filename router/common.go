package router

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func handleError(c *gin.Context) {
	if r := recover(); r != nil {
		c.String(http.StatusBadRequest, r.(error).Error())
	}
}
