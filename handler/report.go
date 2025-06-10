package handler

import (
	"fmt"
	"go-15/service"
)

type HandlerReport struct {
	Service service.ServiceReport
}

func NewHandlerReport(service service.ServiceReport) *HandlerReport {
	return &HandlerReport{
		Service: service,
	}
}

func (h *HandlerReport) ReportOrder() {
	var status string
	fmt.Print("Status :")
	fmt.Scan(&status)
	report, err := h.Service.TotalOrderPerMouth()
	if err != nil {
		fmt.Println("Failed to retrieve data:", err)
		return
	}

	fmt.Println("Order Per Month:")
	for _, t := range report {
		fmt.Printf("Month: %s, Total: %d\n", t.Month, t.TotalOrder)
	}
}
