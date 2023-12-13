package migration

import (
	// "context"
	"context"
	"fmt"
	"log"
	"os"
	"path"

	"path/filepath"
	"strings"

	"github.com/Praneethtkonda/LPGCMS/server/models"
)

const (
	migration_folder_name = "migration/files"
)

func arrayDifference(a, b []string) []string {
	// Create a map to store elements from array b
	bMap := make(map[string]bool)
	for _, value := range b {
		bMap[value] = true
	}

	// Find elements in array b that are not in array a
	var difference []string
	for _, value := range a {
		if !bMap[value] {
			difference = append(difference, value)
		}
	}

	return difference
}

func listMigrationVersion(folderPath string) []string {
	var versions []string
	files, err := os.ReadDir(folderPath)
	log.Println(files)
	if err != nil {
		log.Fatal("error reading SQL files folder: ", err)
	}

	// Iterate over each file and execute SQL statements
	for _, file := range files {
		if file.IsDir() || !strings.HasSuffix(file.Name(), ".sql") {
			continue
		}
		fileNameWithoutExtension := strings.TrimSuffix(file.Name(), path.Ext(file.Name()))
		versions = append(versions, fileNameWithoutExtension)
	}

	dbPool := db.GetPool()
	query := fmt.Sprintf("SELECT version FROM migrations WHERE version IN ('%s')", strings.Join(versions, "','"))
	fmt.Printf("Query: %v\n", query)
	rows, err2 := dbPool.Query(context.Background(), query)
	if err2 != nil {
		log.Printf("Error executing queries: %v\n", err2)
		existsQuery := "SELECT EXISTS (SELECT * FROM information_schema.tables WHERE table_name = 'migrations')"
		var exists bool
		err := dbPool.QueryRow(context.Background(), existsQuery).Scan(&exists)
		if err != nil {
			log.Fatalf("Error running query: %v", err)
		}
		if !exists {
			log.Print("Migrations table doesnot exist")
			return versions
		}
	}
	defer rows.Close()

	var migrated_values []string
	for rows.Next() {
		var version string
		err := rows.Scan(&version)
		if err != nil {
			log.Fatal("Error scanning row:", err)
		}
		migrated_values = append(migrated_values, version)
	}

	fmt.Printf("Migrated values: %v\n", migrated_values)

	if err := rows.Err(); err != nil {
		log.Fatal("Error iterating over rows:", err)
	}
	diff := arrayDifference(versions, migrated_values)
	return diff
}

func executeSQLFile(filePath string, version string) {
	dbPool := db.GetPool()
	bytes, err := os.ReadFile(filePath)
	if err != nil {
		log.Fatalf("Error reading SQL file: %s, %v", filePath, err)
	}
	// TODO: Write a transaction query
	sqlCommands := strings.Split(string(bytes), ";")
	for _, command := range sqlCommands {
		command = strings.TrimSpace(command)
		if command != "" {
			log.Printf("Executing query: %v\n", command)
			_, err := dbPool.Exec(context.Background(), command)
			if err != nil {
				log.Printf("Error executing SQL query: %s, %v", command, err)
			}
		}
	}

	query := "INSERT INTO MIGRATIONS VALUES(DEFAULT, $1)"
	_, err = dbPool.Exec(context.Background(), query, version)
	if err != nil {
		log.Fatalf("Error inserting into migration table %v", err)
	}

}

func doMigration(folderPath string, pendingMigrations []string) {
	for _, version := range pendingMigrations {
		filePath := filepath.Join(folderPath, version + ".sql")
		log.Printf("Executing sql for filepath: %v", filePath)
		executeSQLFile(filePath, version)
	}
}

func Migrate() {
	log.Println("Migration started")
	pendingMigrations := listMigrationVersion(migration_folder_name)
	fmt.Printf("Pending Migrations: %v\n", pendingMigrations)
	doMigration(migration_folder_name, pendingMigrations)
	log.Println("Migrate Finished")
}
