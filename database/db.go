package database

import (
	"database/sql"

	_ "github.com/lib/pq"
)

func InitDB() (*sql.DB, error) {
	connStr := "user=postgres password=postgres dbname=ojek_online sslmode=disable host=192.168.1.4"
	db, err := sql.Open("postgres", connStr)

	return db, err
}
