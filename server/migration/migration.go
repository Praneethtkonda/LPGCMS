package migration

import (
	"context"
	"fmt"
	"log"
	"os"
	"path"

	"path/filepath"
	"strings"

	"github.com/Praneethtkonda/LPGCMS/server/models"
	// "github.com/Praneethtkonda/LPGCMS/server/util"
)

const (
	migration_folder_name = "migration/files"
)

func listMigrationVersion(folderPath string) []string {
	var versions []string
	files, err := os.ReadDir(folderPath)
	log.Printf("Local files: %v", files)
	if err != nil {
		log.Fatal("Error reading SQL files folder: ", err)
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

	// Check if the migrations table exists
	var migrationsTableExists bool
	existsQuery := `
		SELECT EXISTS (
			SELECT 1 FROM information_schema.tables 
			WHERE table_name = 'migrations'
		)
	`
	err = dbPool.QueryRow(context.Background(), existsQuery).Scan(&migrationsTableExists)
	if err != nil {
		log.Fatalf("Error checking table existence: %v", err)
	}
	if !migrationsTableExists {
		log.Print("Migrations table does not exist")
		return versions
	}

	// Prepare and execute query to find differences
	query := fmt.Sprintf(`
		WITH files_versions AS (
			SELECT unnest(ARRAY['%s']) AS version
		)
		SELECT version FROM files_versions
		EXCEPT
		SELECT version FROM migrations WHERE version IN ('%s')
	`, strings.Join(versions, "','"), strings.Join(versions, "','"))

	rows, err := dbPool.Query(context.Background(), query)
	if err != nil {
		log.Fatal("Error executing query:", err)
	}
	defer rows.Close()

	var diffVersions []string
	for rows.Next() {
		var version string
		if err := rows.Scan(&version); err != nil {
			log.Fatal("Error scanning row:", err)
		}
		diffVersions = append(diffVersions, version)
	}

	return diffVersions
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
				log.Fatalf("Error executing SQL query: %s, %v", command, err)
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
		filePath := filepath.Join(folderPath, version+".sql")
		log.Printf("Executing sql for filepath: %v", filePath)
		executeSQLFile(filePath, version)
	}
}

func Migrate() {
	log.Println("Migration started")
	pendingMigrations := listMigrationVersion(migration_folder_name)
	log.Printf("Pending Migrations: %v\n", pendingMigrations)
	doMigration(migration_folder_name, pendingMigrations)
	log.Println("Migration Completed")
}
