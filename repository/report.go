package repository

import (
	"database/sql"
	"go-15/model"
)

type InterfaceRepoReport interface {
	TotalOrderPerMount(status string) ([]*model.Report, error)
}

type RepositoryReport struct {
	DB *sql.DB
}

func NewRepoReport(db *sql.DB) InterfaceRepoReport {
	return &RepositoryReport{
		DB: db,
	}
}

func (repo *RepositoryReport) TotalOrderPerMount(status string) ([]*model.Report, error) {
	query := `SELECT 
			TO_CHAR(DATE_TRUNC('month', datetime_order), 'Month') AS month,
			COUNT(*) AS total_order
			FROM orders
			WHERE status = $1
			GROUP BY month
			ORDER BY MIN(DATE_TRUNC('month', datetime_order))`

	rows, err := repo.DB.Query(query, status)

	if err != nil {
		return nil, err
	}

	var report []*model.Report
	for rows.Next() {
		var r model.Report
		err := rows.Scan(&r.Month, &r.TotalOrder)
		if err != nil {
			return nil, err
		}
		report = append(report, &r)
	}
	return report, nil
}
