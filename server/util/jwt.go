package util

import (
	"fmt"
	"time"
	"sync"

	"github.com/golang-jwt/jwt/v5"

)

// JWTManager is a JSON web token manager
type JWTManager struct {
	secretKey string
	tokenDuration time.Duration
}

// UserClaims is a custom JWT claims that contains some user's information
type UserClaims struct {
	jwt.RegisteredClaims
	Username string `json:"username"`
	Role	 string `json:"role"`

}

var once sync.Once
var jwt_manager *JWTManager

// NewJWTManager returns a singleton JWT Manager
func NewJWTManager() *JWTManager {
	once.Do(func() {
		jwt_manager = &JWTManager{secretKey: JWT_SECRETKEY, tokenDuration: JWT_TokenDuration}
	})
	return jwt_manager
}

// Generate and signs token for a user
func (manager *JWTManager) GenerateAccessToken(username string, role string) (string, error) {
	claims := UserClaims{
		RegisteredClaims: jwt.RegisteredClaims{
			ExpiresAt: jwt.NewNumericDate(time.Now().Add(manager.tokenDuration)),
		},
		Username: username,
		Role: role,
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString([]byte(manager.secretKey))
}

// Verify access token and returns a userclaim if the token is valid
func (manager *JWTManager) VerifyAccessToken(accessToken string) (*UserClaims, error) {
	token, err := jwt.ParseWithClaims(
		accessToken,
		&UserClaims{},
		func(token *jwt.Token) (interface{}, error) {
			_, ok := token.Method.(*jwt.SigningMethodHMAC)
			if !ok {
				return nil, fmt.Errorf("unexpected token signing method")
			}
			return []byte(manager.secretKey), nil
		},
	)

	if err != nil {
		return nil, fmt.Errorf("invalid token: %w", err)
	}

	claims, ok := token.Claims.(*UserClaims)
	if !ok {
		return nil, fmt.Errorf("invalid token claims")
	}

	return claims, nil
}