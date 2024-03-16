package util

import (
	"crypto/tls"
	"log"

	"google.golang.org/grpc/credentials"
)

func LoadTLSCredentials() (credentials.TransportCredentials) {
	// Load server's certificate and private key
	serverCert, err := tls.LoadX509KeyPair(SERVER_CERT, SERVER_KEY)
	if err != nil {
		log.Fatalf("Error loading TLS certificates")
	}

	// Create the credentials and return it
	config := &tls.Config{
		Certificates: []tls.Certificate{serverCert},
		ClientAuth: tls.NoClientCert,
	}
	return credentials.NewTLS(config)
}
