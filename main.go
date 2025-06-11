package main

import (
	"go-15/database"
	"go-15/handler"
	"go-15/repository"
	"go-15/service"
	"log"
)

func main() {
	db, err := database.InitDB()
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	// Initialize Repository and Service
	ReportRepo := repository.NewRepoReport(db)
	ReportService := service.NewServiceReport(ReportRepo)
	ReportHandler := handler.NewHandlerReport(ReportService)

	ReportHandler.ReportOrder()
	// handlerService.List()
}
