package db

import (
	"context"
	"log"
	"sync"
	"time"
	"math/rand"
	"errors"

	"github.com/jackc/pgx/v5/pgxpool"

	"github.com/Praneethtkonda/LPGCMS/server/util"
)

func dbConnRetryExponential(fn func(ctx context.Context, connStr string) (*pgxpool.Pool, error),
						    connStr string,
						  	maxRetries int) (*pgxpool.Pool, error) {
	retryDelay := 1
	for attempt := 1; attempt <= maxRetries; attempt++ {
		log.Printf("Retrying for time: %d", attempt)
		pool, _ := fn(context.Background(), connStr) // Execute the provided function
		err := pool.Ping(context.Background())
		if err == nil {
			return pool, nil // Success, no error
		}

		log.Printf("Attempt %d failed: %s", attempt+1, err)

		// Exponential backoff time calculation
		retryDelay *= 2
		jitter := time.Duration(rand.Intn(1000)) * time.Millisecond // Add jitter for randomness
		waitTime := time.Duration(retryDelay) * time.Second + jitter

		time.Sleep(waitTime)
	}
	// If all retries fail
	return nil, errors.New("failed connecting to db after 10 retries") 
}

var once sync.Once
var pool *pgxpool.Pool

func GetPool() *pgxpool.Pool {
	once.Do(func() {
		connStr := util.DATABASE_URL
		var err error
		pool, err = dbConnRetryExponential(pgxpool.New, connStr, util.MaxDBRetries)
		if err != nil {
			log.Fatalf("Unable to create connection pool: %v\n", err)
		}
	})
	return pool
}

func ClosePool() {
	log.Println("Closing the connection pool")
	if pool != nil {
		pool.Close()
	}
}

func GetConnFromPool(ctx context.Context) *pgxpool.Conn {
	dbPool := pool
	conn, err := dbPool.Acquire(ctx)
	if err != nil {
		log.Fatalf("Unable to acquire a connection: %v\n", err)
	}
	return conn
}

func ReleaseConnFromPool(conn *pgxpool.Conn) {
	conn.Release()
}
