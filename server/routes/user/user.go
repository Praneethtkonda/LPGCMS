package user

import (
	"log"
	"context"
	"google.golang.org/grpc"
	pb "github.com/Praneethtkonda/LPGCMS/server/routes/user/pb"
	// "github.com/Praneethtkonda/LPGCMS/server/models"
)

type server struct {
	pb.UnimplementedUserServiceServer
}

// GRPC Interfaces
func AddServer(s grpc.ServiceRegistrar) {
	pb.RegisterUserServiceServer(s, &server{})
}

// Custom defined function
// Overriding the interface function

func (s *server) RegisterUser(ctx context.Context, in *pb.RegisterUserPayload) (*pb.UserResponse, error) {
	log.Printf("Received Name: %v\n", in.GetName())
	log.Printf("Received phone number: %v\n", in.GetPhonenumber())
	log.Printf("Received Email address: %v\n", in.GetEmailaddress())
	log.Printf("Received Password: %v\n", in.GetPassword())
	log.Printf("Received Floor number: %v\n", in.GetFloornumber())
	// TODO: Store data in db using models
	// TODO: Have enum codes as response for already existing data or error data
	return &pb.UserResponse{Message: "User registered: " + in.GetName()}, nil
}

func (s *server) UpdateUser(ctx context.Context, in *pb.UpdateUserPayload) (*pb.UserResponse, error) {
	log.Printf("Received: %v", in.GetName())
	in.GetPhonenumber()
	in.GetEmailaddress()
	in.GetPassword()
	in.GetFloornumber()
	return &pb.UserResponse{Message: "Hellos " + in.GetName()}, nil
}

func (s *server) DeleteUser(ctx context.Context, in *pb.DeleteUserPayload) (*pb.UserResponse, error) {
	return &pb.UserResponse{Message: ""}, nil
}
