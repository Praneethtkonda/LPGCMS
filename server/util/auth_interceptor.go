package util

import (
	"context"
	"log"

	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
)

// TODO: Generalize the authorization for other users
const userServicePath = "/userpb.UserService/"

var userServiceAccessibleRoles = map[string][]string {
	// userServicePath + "LoginUser"  : {"admin", "user"},
	userServicePath + "UpdateUser" : {"admin", "user"},
	userServicePath + "Deleteuser" : {"admin"},
}

func authorize(ctx context.Context, method string) error {
	log.Print("came inside the authorize method", method, userServiceAccessibleRoles)
	accessibleRoles, ok := userServiceAccessibleRoles[method]
	if !ok {
		log.Print("came here as the login method")
		// Everyone can access the route as it is not present in the authz map
		return nil
	}

	md, ok := metadata.FromIncomingContext(ctx)
	log.Print(md)
	if !ok {
		return status.Errorf(codes.Unauthenticated, "metadata is not provided")
	}

	values := md["authorization"]
	if len(values) == 0 {
		return status.Errorf(codes.Unauthenticated, "authorization token is not provided")
	}

	accessToken := values[0]
	jwt_manager = NewJWTManager()
	claims, err := jwt_manager.VerifyAccessToken(accessToken)
	if err != nil {
		return status.Errorf(codes.Unauthenticated, "access token is invalid: %v", err)
	}

	for _, role := range accessibleRoles {
		if role == claims.Role {
			return nil
		}
	}

	return status.Errorf(codes.PermissionDenied, "no permission to access this route")
}

func AuthUnaryInterceptor(
	ctx context.Context,
	req any,
	info *grpc.UnaryServerInfo,
	handler grpc.UnaryHandler,
	) (any, error) {

	log.Printf("Inside the middleware interceptor for method: %v", info.FullMethod)
	err := authorize(ctx, info.FullMethod)
	if err != nil {
		log.Print("came here as there is authorization error")
		return nil, err
	}
	log.Print("No authorization erorr")
	return handler(ctx, req)
}