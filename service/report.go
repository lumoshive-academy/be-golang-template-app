package service

import (
	"go-15/model"
	"go-15/repository"
)

type ServiceReport struct {
	RepoReport repository.RepositoryReport
}

func NewServiceReport(repoReport repository.RepositoryReport) ServiceReport {
	return ServiceReport{
		RepoReport: repoReport,
	}
}

func (serviceReport *ServiceReport) TotalOrderPerMouth(status string) ([]*model.Report, error) {
	return serviceReport.RepoReport.TotalOrderPerMount(status)
}
