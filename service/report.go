package service

import (
	"go-15/model"
	"go-15/repository"
)

type InterfaceServiceReport interface {
	TotalOrderPerMouth(status string) ([]*model.Report, error)
}

type ServiceReport struct {
	RepoReport repository.InterfaceRepoReport
}

func NewServiceReport(repoReport repository.InterfaceRepoReport) *ServiceReport {
	return &ServiceReport{
		RepoReport: repoReport,
	}
}

func (serviceReport *ServiceReport) TotalOrderPerMouth(status string) ([]*model.Report, error) {
	return serviceReport.RepoReport.TotalOrderPerMount(status)
}
