package main

import (
	"context"
	"log"
	"time"

	pb "github.com/Praneethtkonda/LPGCMS/server/routes/user/pb"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

const (
	server_url = "localhost:50051"
)

func main() {
	// Set up a connection to the server.
	conn, err := grpc.Dial(server_url, grpc.WithTransportCredentials(insecure.NewCredentials()))
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
		log.Fatalf("could not register user: %v", err)
	}
	log.Printf("Message from grpc server: %s", r.GetMessage())
}
