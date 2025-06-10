package database

import (
	"database/sql"

	_ "github.com/lib/pq"
)

func InitDB() (*sql.DB, error) {
	connStr := "user=postgres password=postgres dbname=ojek_online sslmode=disable host=localhost"
	db, err := sql.Open("postgres", connStr)

	return db, err
}
