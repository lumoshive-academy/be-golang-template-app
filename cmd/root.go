package cmd

import (
	"fmt"
	"go-15/service"

	"github.com/spf13/cobra"
)

var (
	rootCmd = &cobra.Command{
		Use:   "app",
		Short: "Golang CLI Template App",
	}
	templateService service.ServiceTemplate
)

func SetTemplateService(s service.ServiceTemplate) {
	templateService = s
}

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
	}
}
