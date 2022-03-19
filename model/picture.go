package model

import "gorm.io/gorm"

type Picture struct {
	gorm.Model
	PID string `grom:"uniqueIndex;column:pid" json:"pid"`
	UID string `gorm:"column:uid" json:"uid"`
}
