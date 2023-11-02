package conn

import (
	"context"
	"fmt"
	"log"

	"github.com/jackc/pgx/v5/pgxpool"
)

// type Pool struct *pgxpool{

// }

func DbConnection() int {
	connStr := "user=username password=password host=localhost port=5432 dbname=mydb sslmode=disable"

	// Create a connection pool
	config, err := pgxpool.ParseConfig(connStr)
	if err != nil {
		log.Fatal("Error parsing connection string:", err)
	}

	pool, err := pgxpool.NewWithConfig(context.Background(), config)
	if err != nil {
		log.Fatal("Error connecting to the database:", err)
	}
	defer pool.Close()

	// Execute a query
	rows, err := pool.Query(context.Background(), "SELECT * FROM your_table")
	if err != nil {
		log.Fatal("Error executing query:", err)
	}
	defer rows.Close()

	// Process query results
	for rows.Next() {
		var id int
		var name string

		err := rows.Scan(&id, &name)
		if err != nil {
			log.Fatal("Error scanning row:", err)
		}

		fmt.Printf("ID: %d, Name: %s\n", id, name)
	}

	if err := rows.Err(); err != nil {
		log.Fatal("Error iterating over rows:", err)
	}
	return 0
}
