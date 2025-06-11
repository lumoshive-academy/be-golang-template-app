package repository

import (
	"testing"

	"github.com/DATA-DOG/go-sqlmock"
	"github.com/stretchr/testify/assert"
)

func TestTotalOrderPerMount(t *testing.T) {
	// Mock DB and sqlmock
	db, mock, err := sqlmock.New()
	assert.NoError(t, err)
	defer db.Close()

	rows := sqlmock.NewRows([]string{"month", "total_order"}).
		AddRow("January", 10).
		AddRow("February", 20)

	mock.ExpectQuery("SELECT (.+) FROM orders WHERE status = \\$1 GROUP BY month ORDER BY MIN").
		WithArgs("completed").
		WillReturnRows(rows)

	repo := NewRepoReport(db)

	result, err := repo.TotalOrderPerMount("completed")

	assert.NoError(t, err)
	assert.Len(t, result, 2)

	assert.Equal(t, "January", result[0].Month)
	assert.Equal(t, 10, result[0].TotalOrder)

	assert.Equal(t, "February", result[1].Month)
	assert.Equal(t, 20, result[1].TotalOrder)

	err = mock.ExpectationsWereMet()
	assert.NoError(t, err)
}
