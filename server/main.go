package main

import (
	"google.golang.org/grpc"
	"log"
	"net"

	"github.com/Praneethtkonda/LPGCMS/server/migration"
	"github.com/Praneethtkonda/LPGCMS/server/routes"
)

func main() {
	migration.Migrate()
	lis, err := net.Listen("tcp", ":50051")
	if err != nil {
		log.Fatalf("Failed to listen: %v", err)
	}

	grpcServer := grpc.NewServer()
	routes.IncludeRoutes(grpcServer)

	log.Printf("Server listening on port [::]50051")
	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("Failed to serve: %v", err)
	}
}
