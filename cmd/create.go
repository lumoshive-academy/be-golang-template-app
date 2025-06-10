package cmd

import (
	"fmt"
	"go-15/model"
	"strings"

	"github.com/spf13/cobra"
)

var (
	username string
	password string
)

var createCmd = &cobra.Command{
	Use:   "create",
	Short: "Create a new template",
	Run: func(cmd *cobra.Command, args []string) {
		// Trim spaces
		username = strings.TrimSpace(username)
		password = strings.TrimSpace(password)

		if username == "" || password == "" {
			fmt.Println("Username and password must not be empty")
			return
		}

		t := &model.Template{
			Username: username,
			Password: password,
		}

		err := templateService.Create(t)
		if err != nil {
			fmt.Println("Failed to create template:", err)
			return
		}

		fmt.Println("Template created successfully with ID:", t.ID)
	},
}

func init() {
	createCmd.Flags().StringVarP(&username, "username", "u", "", "Username for the template (required)")
	createCmd.Flags().StringVarP(&password, "password", "p", "", "Password for the template (required)")
	createCmd.MarkFlagRequired("username")
	createCmd.MarkFlagRequired("password")

	rootCmd.AddCommand(createCmd)
}
