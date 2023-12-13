package db

import (
	"context"
	"log"
	"os"
	"sync"

	"github.com/jackc/pgx/v5/pgxpool"
)

var once sync.Once
var pool *pgxpool.Pool

func GetPool() *pgxpool.Pool {
	once.Do(func() {
		connStr := os.Getenv("DATABASE_URL")
		log.Print(connStr)
		var err error
		pool, err = pgxpool.New(context.Background(), connStr)
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
