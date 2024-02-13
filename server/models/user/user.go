package user

import (
	"context"
	"golang.org/x/crypto/bcrypt"
	"log"

	"github.com/Praneethtkonda/LPGCMS/server/models"
)

func RegisterUser(name string, phone string, email string, password string, floor string) error {
	dbPool := db.GetPool()
	query := "INSERT INTO USERS VALUES(DEFAULT, $1, $2, $3, $4, $5, $6, DEFAULT, DEFAULT, DEFAULT)"
	info := "Test info" // Change this properly

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	log.Printf("Generated hash %v", string(hashedPassword))
	if err != nil {
		return err
	}

	// TODO: Login logic
	// err = bcrypt.CompareHashAndPassword(hashedPassword, []byte("secret"))
	// if err != nil {
	// 	log.Print("Passwords are not same")
	// } else {
	// 	log.Print("Passwords are same")
	// }

	_, err = dbPool.Exec(context.Background(), query, name,
		floor, phone, email, info, string(hashedPassword))
	return err
}
