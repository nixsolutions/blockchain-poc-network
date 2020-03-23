package main

import (
	"fmt"
	"github.com/hyperledger/fabric-chaincode-go/shim"
	"poc_kinder/contract"
)

// main function starts up the chaincode in the container during instantiate
func main() {
	if err := shim.Start(new(contract.KinderContract)); err != nil {
		fmt.Printf("Error starting MedicalContract chaincode: %s", err)
	}
}
