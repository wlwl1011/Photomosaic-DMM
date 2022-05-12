package model

import (
	"fmt"
	"io"

	"github.com/google/uuid"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type postgresHandler struct {
	db *gorm.DB
}

func NewPostgresqlHandler() (DBHandler, error) {
	dsn := "host=localhost user=postgres password=postgres dbname=postgres port=5432 sslmode=disable TimeZone=Asia/Seoul"
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		return nil, err
	}

	db.AutoMigrate(&Picture{})

	return &postgresHandler{db}, nil
}

func (h *postgresHandler) Upload(uid, ext string, reader io.Reader, objectSize int64) (string, error) {
	var picture Picture
	picture.UID = uid
	picture.PID = uuid.New().String() + ext

	tx := h.db.Create(&picture)
	if tx.Error != nil {
		fmt.Println(tx.Error)
		return "", nil
	}

	putObject(uid+"/"+picture.PID, reader, objectSize)
	return "success", nil
}

func (h *postgresHandler) Delete(uid, pid, ext string, reader io.Reader, objectSize int64) (string, error) {

	var picture Picture = getObject(uid+"/"+pid)

	
	tx := h.db.Delete(&picture)
	if tx.Error != nil {
		fmt.Println(tx.Error)
		return "", nil
	}

	
	return "success", nil
}

func (h *postgresHandler) RetrieveList(uid string) ([]*Picture, error) {
	var pictures []*Picture

	result := h.db.Where("uid = ?", uid).Find(&pictures)
	return pictures, result.Error
}

func (h *postgresHandler) GetObject(objectName string) (io.Reader, error) {
	return getObject(objectName)
}
