package common

import (
	"fmt"

	"github.com/google/uuid"
)

func GeneratePID(prefix, ext string) string {
	return fmt.Sprintf("%s-%s%s", prefix, uuid.New().String(), ext)

}
