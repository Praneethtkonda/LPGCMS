package util

import (
	"os"
	"time"
)

const (
    // MaxRetries defines the maximum number of retries
    MaxDBRetries = 10

	//JWT Token Duration
	JWT_TokenDuration = 10 * time.Minute

	// TLS
	SERVER_CERT = "cert/server-cert.pem"
	SERVER_KEY = "cert/server-key.pem"
)

var (
	DATABASE_URL = os.Getenv("DATABASE_URL")
	JWT_SECRETKEY = os.Getenv("JWT_SECRET")
)