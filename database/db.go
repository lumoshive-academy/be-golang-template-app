package database

import (
	"database/sql"
)

func InitDB() (*sql.DB, error) {
	connStr := "user=postgres password=postgres dbname=postgres sslmode=disable"
	db, err := sql.Open("postgres", connStr)

	return db, err
}
