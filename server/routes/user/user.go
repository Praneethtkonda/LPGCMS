package user

import (
	"context"
	"log"

	"github.com/Praneethtkonda/LPGCMS/server/models/user"
	pb "github.com/Praneethtkonda/LPGCMS/server/routes/user/pb"
	"github.com/Praneethtkonda/LPGCMS/server/util"
	"google.golang.org/grpc"
	// "google.golang.org/grpc/codes"
	// "google.golang.org/grpc/status"
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
	log.Print("Got user details")
	// TODO: Have enum codes as response for already existing data or error data
	err := user.RegisterUser(in.GetName(), in.GetPhonenumber(), in.GetEmailaddress(), in.GetPassword(), in.GetFloornumber())
	if err != nil {
		log.Printf("Error registering user: %v", err)
		// TODO: Send a different error properly to the user
		return &pb.UserResponse{Message: "User not registered: " + in.GetName()}, err
	}
	return &pb.UserResponse{Message: "User registered: " + in.GetName()}, nil
}

func (s *server) LoginUser(ctx context.Context, in *pb.LoginUserPayload) (*pb.UserResponse, error) {
	err := user.LoginUser(in.GetPhonenumber(), in.GetPassword())
	if err != nil {
		log.Printf("Error logging user: %v", err)
		return &pb.UserResponse{Message: "User provided credentials are wrong"}, err
	}

	jwt_manager := util.NewJWTManager()
	token, err := jwt_manager.GenerateAccessToken(in.GetPhonenumber(), in.GetRole())
	if err != nil {
		log.Printf("Error generating access token: %v", err)
		return &pb.UserResponse{Message: "Error logging user"}, err
	}
	return &pb.UserResponse{Message: token}, nil
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
