package service

import (
	"go-15/model"

	"github.com/stretchr/testify/mock"
)

// MockRepositoryReport implements repository.RepositoryReport
type MockServiceReport struct {
	mock.Mock
}

func (m *MockServiceReport) TotalOrderPerMouth(status string) ([]*model.Report, error) {
	args := m.Called(status)
	return args.Get(0).([]*model.Report), args.Error(1)
}
