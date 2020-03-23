package service

import (
	"encoding/json"
	"fmt"
	"github.com/hyperledger/fabric-chaincode-go/shim"
	"poc_kinder/contract/model"
)

type ReportService struct {
	basicRepo *BasicRepository
	keyPrefix string
}

func NewReportService(stub shim.ChaincodeStubInterface) *ReportService {
	return &ReportService{basicRepo: &BasicRepository{Stub: stub}, keyPrefix: "RPR"}
}

func (service *ReportService) Find(key string) []byte {
	return service.basicRepo.Find(service.keyPrefix + key)
}

func (service *ReportService) FindAndUnmarshal(key string, report *model.Report) error {
	return service.basicRepo.FindAndUnmarshal(service.keyPrefix+key, report)
}

func (service *ReportService) Exists(key string) (bool, error) {
	return service.basicRepo.Exists(service.keyPrefix + key)
}

func (service *ReportService) Put(key string, report []byte) error {
	return service.basicRepo.Stub.PutState(service.keyPrefix+key, report)
}

func (service *ReportService) FindAllForParent(parent string) ([]model.Report, error) {
	queryString := fmt.Sprintf("{\"selector\":{\"parent_id\":\"%s\"}}", parent)
	return service.FindReportsByQuery(queryString)
}

func (service *ReportService) FindAllForDoctor(doctor string) ([]model.Report, error) {
	queryString := fmt.Sprintf("{\"selector\":{\"doctor_id\":\"%s\"}}", doctor)
	return service.FindReportsByQuery(queryString)
}

func (service *ReportService) FindAllForKindergarten(kindergarten string) ([]model.Report, error) {
	queryString := fmt.Sprintf("{\"selector\":{\"hospitals\":{\"$elemMatch\": {\"id\": \"%s\"}}}", kindergarten)
	return service.FindReportsByQuery(queryString)
}

func (service *ReportService) FindReportsByQuery(queryString string) ([]model.Report, error) {
	resultsIterator, err := service.basicRepo.Stub.GetQueryResult(queryString)
	if err != nil {
		return nil, err
	}
	defer resultsIterator.Close()
	var reports []model.Report

	for resultsIterator.HasNext() {
		queryResponse, err := resultsIterator.Next()
		if err != nil {
			return nil, err
		}
		var card model.Report
		err = json.Unmarshal(queryResponse.Value, &card)
		if err != nil {
			return nil, err
		}
		reports = append(reports, card)
	}
	return reports, nil
}

