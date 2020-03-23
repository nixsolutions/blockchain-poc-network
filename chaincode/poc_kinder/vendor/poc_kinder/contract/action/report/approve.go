package report

import (
	"encoding/json"
	"errors"
	"fmt"
	"github.com/hyperledger/fabric-chaincode-go/shim"
	"poc_kinder/contract/model"
	"poc_kinder/contract/service"
)

func Approve(stub shim.ChaincodeStubInterface, args []string) (string, error) {
	if len(args) != 2 {
		return "", fmt.Errorf("Incorrect arguments. Expecting a key and hospital")
	}

	var report model.Report
	reportService := service.NewReportService(stub)
	user, err := service.NewAuthService(stub).GetUser()
	if err != nil {
		return "", err
	}
	if !user.IsParent() {
		return "", errors.New("only parent can approve request")
	}

	err = reportService.FindAndUnmarshal(args[0], &report)
	if err != nil {
		return "", err
	}
	if report.Parent != user.Id {
		return "", errors.New("only card owner can approve report")
	}

	report.Approve(args[1])

	jsonBytes, err := json.Marshal(report)
	if err != nil {
		return "", fmt.Errorf("Failed to marshall report obj", args[0])
	}
	err = reportService.Put(args[0], jsonBytes)
	if err != nil {
		return "", fmt.Errorf("Failed to put report obj", args[0])
	}
	return string(jsonBytes), nil
}
