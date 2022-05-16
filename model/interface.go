package model

import "io"

type DBHandler interface {
	Upload(uid, pid string, reader io.Reader, objectSize int64) error
	Delete(uid, pid string) error
	RetrieveList(uid string) ([]*Picture, error)
	GetObject(objectName string) (io.Reader, error)
}
