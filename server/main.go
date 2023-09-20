package main

import (
	"google.golang.org/grpc"
	"log"
	"net"

	"github.com/Praneethtkonda/LPGCMS/server/models"
)

func main() {
	lis, err := net.Listen("tcp", ":9000")
	if err != nil {
		log.Fatalf("Failed to listen: %v", err)
	}

	var ret int = models.Hello()
	log.Printf("%v", ret)
	grpcServer := grpc.NewServer()
	log.Printf("Server serving on port [::]50051")
	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("Failed to serve: %v", err)
	}
}
