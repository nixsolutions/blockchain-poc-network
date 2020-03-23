package model

const HOSPITAL_ORG = "HospitalMSP"
const PARENTS_ORG = "ParentsMSP"
const KINDERGARTEN_ORG = "KindergartenMSP"

type User struct {
	Id   string
	Org  string
}

func NewUser(id, org string) *User {
	return &User{Id: id, Org: org}
}
func (user *User) IsHospitalWorker() bool {
	return user.Org == HOSPITAL_ORG
}

func (user *User) IsKindergartenWorker() bool {
	return user.Org == KINDERGARTEN_ORG
}

func (user *User) IsParent() bool {
	return user.Org == PARENTS_ORG
}