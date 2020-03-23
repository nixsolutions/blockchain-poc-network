package model

const CREATED_STATUS = "created"
const APPROVED_STATUS = "approved"

const DATA_RELEVANT = "relevant"
const DATA_IRRELEVANT = "irrelevant"

type Report struct {
	Id         string     `json:"id"`
	Status     string     `json:"status"`
	CardId     string     `json:"card_id"`
	Parent     string     `json:"parent_id"`
	Doctor     string     `json:"doctor_id"`
	Data       ReportData `json:"report_data,omitempty"`
	Hospitals  []Hospital `json:"hospitals, omitempty"`
	DataStatus string     `json:"data_status"`
}
type Hospital struct {
	Id string `json:"id"`
}

func CreateReport(id string, cardId string, data ReportData, parent string, doctor string) Report {
	return Report{
		Status:     CREATED_STATUS,
		CardId:     cardId,
		Data:       data,
		Parent:     parent,
		Id:         id,
		Doctor:     doctor,
		DataStatus: DATA_RELEVANT,
	}
}

type ReportData struct {
	Id          string            `json:"id"` //same as key in the couchdb
	Type        string            `json:"type"`
	Name        string            `json:"name"`
	BirthDate   string            `json:"birth_date"`
	Height      int               `json:"height"`
	Weight      int               `json:"weight"`
	Vaccination []VaccinationItem `json:"vaccination"`
	Parent      string            `json:"parent"`
}

type VaccinationItem struct {
	Name      string `json:"name"`
	Timestamp int64  `json:"timestamp"`
}

func (report *Report) Approve(hospital string) {
	report.Status = APPROVED_STATUS
	report.Hospitals = append(report.Hospitals, Hospital{Id: hospital})
}
