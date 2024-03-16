package main

import (
	"context"
	"crypto/tls"
	"crypto/x509"
	"fmt"
	"log"
	"os"
	"time"

	pb "github.com/Praneethtkonda/LPGCMS/server/routes/user/pb"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
	// "google.golang.org/grpc/credentials/insecure"
)

const (
	server_url = "0.0.0.0:50051"
)

func loadTLSCredentials() (credentials.TransportCredentials, error) {
	// Load certificate of the CA who signed server's certificate
	pemServerCA, err := os.ReadFile("../cert/ca-cert.pem")
	if err != nil {
		return nil, err
	}

	certPool := x509.NewCertPool()
	if !certPool.AppendCertsFromPEM(pemServerCA) {
		return nil, fmt.Errorf("failed to add server CA's certificate")
	}

	// Create the credentials and return it
	config := &tls.Config{
		RootCAs: certPool,
	}
	return credentials.NewTLS(config), nil
}

func main() {
	// Set up a connection to the server.
	tlsCredentials, err := loadTLSCredentials()
	if err != nil {
		log.Fatalf("Failed to load TLS credentials")
	}

	// conn, err := grpc.Dial(server_url, grpc.WithTransportCredentials(insecure.NewCredentials()))
	conn, err := grpc.Dial(server_url, grpc.WithTransportCredentials(tlsCredentials))
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}
	defer conn.Close()
	userServiceClient := pb.NewUserServiceClient(conn)

	// Contact the server and print out its response.
	ctx, cancel := context.WithTimeout(context.Background(), time.Second)
	defer cancel()

	// Testing starts from here
	r, err := userServiceClient.RegisterUser(ctx, &pb.RegisterUserPayload{
		Name:         "Praneeth",
		Phonenumber:  "8129691950",
		Emailaddress: "test@email.com",
		Password:     "secret",
		Floornumber:  "2"})
	if err != nil {
		log.Printf("could not register user: %v", err)
	}

	r, err = userServiceClient.LoginUser(ctx, &pb.LoginUserPayload{
		Role: "mobile_user",
		Phonenumber: "8129691950",
		Password: "secret",
	})
	if err != nil {
		log.Printf("Login failed: %v", err)
	}

	log.Printf("Message from grpc server: %v", r.GetMessage())
}
