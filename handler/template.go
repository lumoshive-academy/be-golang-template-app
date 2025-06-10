package handler

import (
	"bufio"
	"fmt"
	"go-15/model"
	"go-15/service"
	"os"
	"strconv"
	"strings"
)

type TemplateHandler struct {
	Service service.ServiceTemplate
}

func NewTemplateHandler(service service.ServiceTemplate) *TemplateHandler {
	return &TemplateHandler{
		Service: service,
	}
}

func (h *TemplateHandler) Create() {
	reader := bufio.NewReader(os.Stdin)

	fmt.Print("Enter username: ")
	username, _ := reader.ReadString('\n')
	username = strings.TrimSpace(username)

	fmt.Print("Enter password: ")
	password, _ := reader.ReadString('\n')
	password = strings.TrimSpace(password)

	template := &model.Template{
		Username: username,
		Password: password,
	}

	err := h.Service.Create(template)
	if err != nil {
		fmt.Println("Failed to create data:", err)
		return
	}

	fmt.Println("Data created successfully with ID:", template.ID)
}

func (h *TemplateHandler) List() {
	templates, err := h.Service.List()
	if err != nil {
		fmt.Println("Failed to retrieve data:", err)
		return
	}

	fmt.Println("Template List:")
	for _, t := range templates {
		fmt.Printf("ID: %d, Username: %s, Password: %s, CreatedAt: %s\n", t.ID, t.Username, t.Password, t.CreatedAt.Format("2006-01-02 15:04:05"))
	}
}

func (h *TemplateHandler) Update() {
	reader := bufio.NewReader(os.Stdin)

	fmt.Print("Enter ID to update: ")
	idStr, _ := reader.ReadString('\n')
	idStr = strings.TrimSpace(idStr)
	id, err := strconv.Atoi(idStr)
	if err != nil {
		fmt.Println("Invalid ID:", err)
		return
	}

	fmt.Print("Enter new username: ")
	username, _ := reader.ReadString('\n')
	username = strings.TrimSpace(username)

	fmt.Print("Enter new password: ")
	password, _ := reader.ReadString('\n')
	password = strings.TrimSpace(password)

	template := &model.Template{
		Username: username,
		Password: password,
	}

	err = h.Service.Update(id, template)
	if err != nil {
		fmt.Println("Failed to update data:", err)
		return
	}

	fmt.Println("Data updated successfully.")
}

func (h *TemplateHandler) Delete() {
	reader := bufio.NewReader(os.Stdin)

	fmt.Print("Enter ID to delete: ")
	idStr, _ := reader.ReadString('\n')
	idStr = strings.TrimSpace(idStr)
	id, err := strconv.Atoi(idStr)
	if err != nil {
		fmt.Println("Invalid ID:", err)
		return
	}

	err = h.Service.Delete(id)
	if err != nil {
		fmt.Println("Failed to delete data:", err)
		return
	}

	fmt.Println("Data deleted successfully.")
}
