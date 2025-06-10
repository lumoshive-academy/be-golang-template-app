package main

import (
	"go-15/cmd"
	"go-15/database"
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
	templateRepo := repository.NewRepoTemplate(db)
	templateService := service.NewServiceTemplate(templateRepo)

	// Inject to command
	cmd.SetTemplateService(templateService)

	// Run CLI
	cmd.Execute()
}
