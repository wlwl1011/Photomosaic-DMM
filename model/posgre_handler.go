package model

import (
	"io"

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

func (h *postgresHandler) Upload(uid, pid string, reader io.Reader, objectSize int64) error {
	var picture Picture
	picture.UID = uid
	picture.PID = pid

	tx := h.db.Create(&picture)
	if tx.Error != nil {
		return tx.Error
	}

	putObject(uid+"/"+picture.PID, reader, objectSize)
	return nil
}

func (h *postgresHandler) Delete(uid, pid string) error {

	// delete from minio
	err := deleteObject(uid + "/" + pid)
	if err != nil {

		return err
	}

	// delete from db
	var picture Picture
	tx := h.db.Model(&Picture{}).Where("p_id=?", pid).First(&picture)
	if tx.Error != nil {
		return tx.Error
	}

	tx = h.db.Delete(&picture)
	if tx.Error != nil {
		return tx.Error
	}

	return nil
}

func (h *postgresHandler) RetrieveList(uid string) ([]*Picture, error) {
	var pictures []*Picture

	result := h.db.Where("uid = ?", uid).Find(&pictures)
	return pictures, result.Error
}

func (h *postgresHandler) GetObject(objectName string) (io.Reader, error) {
	return getObject(objectName)
}
