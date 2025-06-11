package repository

import (
	"go-15/model"

	"github.com/stretchr/testify/mock"
)

// MockRepositoryReport implements repository.RepositoryReport
type MockRepositoryReport struct {
	mock.Mock
}

func (m *MockRepositoryReport) TotalOrderPerMount(status string) ([]*model.Report, error) {
	args := m.Called(status)
	return args.Get(0).([]*model.Report), args.Error(1)
}
