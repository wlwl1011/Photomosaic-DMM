package model

import (
	"context"
	"io"
	"log"

	"github.com/minio/minio-go/v7"
	"github.com/minio/minio-go/v7/pkg/credentials"
)

const (
	endpoint        = "localhost:9000"
	secretAccessKey = "password"
	accessKeyID     = "user"
	bucketName      = "testbucket"
)

var minioClient *minio.Client

func init() {
	var err error
	minioClient, err = minio.New(endpoint, &minio.Options{
		Creds:  credentials.NewStaticV4(accessKeyID, secretAccessKey, ""),
		Secure: false,
	})
	if err != nil {
		panic(err)
	}

	exists, errBucketExists := minioClient.BucketExists(context.Background(), bucketName)
	if errBucketExists != nil {
		panic(errBucketExists)
	}

	if !exists {
		err = minioClient.MakeBucket(context.Background(), bucketName, minio.MakeBucketOptions{Region: "ASIA-NORTHEAST3"})
		if err != nil {
			panic(err)
		} else {
			log.Printf("Successfully created %s\n", bucketName)
		}
	}
}

func putObject(objectName string, reader io.Reader, objectSize int64) error {
	minioClient.PutObject(context.TODO(), bucketName, objectName, reader, objectSize, minio.PutObjectOptions{})
	return nil
}

func getObject(objectName string) (io.Reader, error) {
	return minioClient.GetObject(context.TODO(), bucketName, objectName, minio.GetObjectOptions{})
}

func deleteObject(objectName string) error {
	return minioClient.RemoveObject(context.TODO(), bucketName, objectName, minio.RemoveObjectOptions{})
}
