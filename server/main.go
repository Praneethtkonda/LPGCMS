package main

import (
	"google.golang.org/grpc"
	"log"
	"net"
	"os"
	"os/signal"
	"sync"
	"syscall"

	"github.com/Praneethtkonda/LPGCMS/server/migration"
	"github.com/Praneethtkonda/LPGCMS/server/models"
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
	registerGracefulShutdown(grpcServer)

	log.Printf("Server listening on port [::]50051")
	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("Failed to serve: %v", err)
	}
}

func registerGracefulShutdown(grpcserver *grpc.Server) {
	sigCh := make(chan os.Signal, 1)
	signal.Notify(sigCh, os.Interrupt, syscall.SIGTERM)
	wg := sync.WaitGroup{}
	wg.Add(1)
	go func() {
		s := <-sigCh
		log.Printf("Got signal %v, Attempting graceful shutdown", s)
		grpcserver.GracefulStop()
		db.ClosePool()
		wg.Done()
	}()
}
