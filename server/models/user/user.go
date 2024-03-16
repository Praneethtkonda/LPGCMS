package user

import (
	"context"
	"errors"
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

	_, err = dbPool.Exec(context.Background(), query, name,
		floor, phone, email, info, string(hashedPassword))
	return err
}

func LoginUser(phone string, password string) error {
	dbPool := db.GetPool()
	query := "SELECT password FROM USERS WHERE phone_number=$1"
	var pwd string
	err := dbPool.QueryRow(context.Background(), query, phone).Scan(&pwd)
	if err != nil {
		log.Print("Error executing login query")
		return err
	}

	if pwd == "" {
		log.Print("Login error")
		return errors.New("login error")
	}

	err = bcrypt.CompareHashAndPassword([]byte(pwd), []byte(password))
	if err != nil {
		return errors.New("login error")
	}
	log.Print("Logged in successfully")
	return nil
}