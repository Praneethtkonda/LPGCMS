package user

import (
	"context"
	// "log"

	"github.com/Praneethtkonda/LPGCMS/server/models"
)

func RegisterUser(name string, phone string, email string, password string, floor string) error {
	dbPool := db.GetPool()
	query := "INSERT INTO USERS VALUES($1, $2, $3, $4, $5)"
	_, err := dbPool.Exec(context.Background(), query, name, phone, email, password, floor)
	return err
}