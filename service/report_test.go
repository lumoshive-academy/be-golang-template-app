package service

import (
	"errors"
	"go-15/model"
	"go-15/repository"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestTotalOrderPerMouth_Success(t *testing.T) {
	mockRepo := new(repository.MockRepositoryReport)
	expectedReports := []*model.Report{
		{Month: "Januari", TotalOrder: 10},
		{Month: "Februari", TotalOrder: 5},
	}

	mockRepo.On("TotalOrderPerMount", "completed").Return(expectedReports, nil)

	service := NewServiceReport(mockRepo)
	reports, err := service.TotalOrderPerMouth("completed")

	assert.NoError(t, err)
	assert.Equal(t, expectedReports, reports)
	mockRepo.AssertExpectations(t)
}

func TestTotalOrderPerMouth_Error(t *testing.T) {
	mockRepo := new(repository.MockRepositoryReport)
	mockRepo.On("TotalOrderPerMount", "failed").Return(([]*model.Report)(nil), errors.New("database error"))

	service := NewServiceReport(mockRepo)
	reports, err := service.TotalOrderPerMouth("failed")

	assert.Error(t, err)
	assert.Nil(t, reports)
	assert.EqualError(t, err, "database error")
	mockRepo.AssertExpectations(t)
}
