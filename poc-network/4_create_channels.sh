DELAY="3"
LANGUAGE="golang"

CORE_PEER_LOCALMSPID="ParentsMSP"
CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_PARENTS_CA
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/parents.poc-network.com/users/Admin@parents.poc-network.com/msp
CORE_PEER_ADDRESS=peer0.parents.poc-network.com:7051
peer channel create -o orderer.poc-network.com:7050 -c parentshospital -f ./channel-artifacts/parentshospital.tx --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/poc-network.com/orderers/orderer.poc-network.com/msp/tlscacerts/tlsca.poc-network.com-cert.pem
peer channel create -o orderer.poc-network.com:7050 -c parentshospitalkindergarten -f ./channel-artifacts/parentshospitalkindergarten.tx --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/poc-network.com/orderers/orderer.poc-network.com/msp/tlscacerts/tlsca.poc-network.com-cert.pem

ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/poc-network.com/orderers/orderer.poc-network.com/msp/tlscacerts/tlsca.poc-network.com-cert.pem
PEER0_PARENTS_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/parents.poc-network.com/peers/peer0.parents.poc-network.com/tls/ca.crt
PEER0_HOSPITAL_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/hospital.poc-network.com/peers/peer0.hospital.poc-network.com/tls/ca.crt
PEER0_KINDERGARTEN_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/kindergarten.poc-network.com/peers/peer0.kindergarten.poc-network.com/tls/ca.crt

# JOIN PEERS ORGANISATION'S TO parentshospital CHANNEL

# JOIN PEERS ParentsMSP TO parentshospital CHANNEL
CORE_PEER_LOCALMSPID="ParentsMSP"
CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_PARENTS_CA
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/parents.poc-network.com/users/Admin@parents.poc-network.com/msp

CORE_PEER_ADDRESS=peer0.parents.poc-network.com:7051
peer channel join -b parentshospital.block

CORE_PEER_ADDRESS=peer1.parents.poc-network.com:8051
peer channel join -b parentshospital.block

# JOIN PEERS HospitalMSP TO parentshospital CHANNEL
CORE_PEER_LOCALMSPID="HospitalMSP"
CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_HOSPITAL_CA
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/hospital.poc-network.com/users/Admin@hospital.poc-network.com/msp

CORE_PEER_ADDRESS=peer0.hospital.poc-network.com:9051
peer channel join -b parentshospital.block

CORE_PEER_ADDRESS=peer1.hospital.poc-network.com:10051
peer channel join -b parentshospital.block

# JOIN PEERS ORGANISATION'S TO parentshospitalkindergarten CHANNEL

# JOIN PEERS ParentsMSP TO parentshospitalkindergarten CHANNEL
CORE_PEER_LOCALMSPID="ParentsMSP"
CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_PARENTS_CA
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/parents.poc-network.com/users/Admin@parents.poc-network.com/msp

CORE_PEER_ADDRESS=peer0.parents.poc-network.com:7051
peer channel join -b parentshospitalkindergarten.block

CORE_PEER_ADDRESS=peer1.parents.poc-network.com:8051
peer channel join -b parentshospitalkindergarten.block

# JOIN PEERS HospitalMSP TO parentshospitalkindergarten CHANNEL
CORE_PEER_LOCALMSPID="HospitalMSP"
CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_HOSPITAL_CA
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/hospital.poc-network.com/users/Admin@hospital.poc-network.com/msp

CORE_PEER_ADDRESS=peer0.hospital.poc-network.com:9051
peer channel join -b parentshospitalkindergarten.block

CORE_PEER_ADDRESS=peer1.hospital.poc-network.com:10051
peer channel join -b parentshospitalkindergarten.block

# JOIN PEERS KindergartenMSP TO parentshospitalkindergarten CHANNEL
CORE_PEER_LOCALMSPID="KindergartenMSP"
CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_KINDERGARTEN_CA
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/kindergarten.poc-network.com/users/Admin@kindergarten.poc-network.com/msp

CORE_PEER_ADDRESS=peer0.kindergarten.poc-network.com:11051
peer channel join -b parentshospitalkindergarten.block

CORE_PEER_ADDRESS=peer1.kindergarten.poc-network.com:12051
peer channel join -b parentshospitalkindergarten.block

# UPDATE PEERS IN parentshospital CHANNEL

CORE_PEER_LOCALMSPID="ParentsMSP"
CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_PARENTS_CA
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/parents.poc-network.com/users/Admin@parents.poc-network.com/msp
CORE_PEER_ADDRESS=peer0.parents.poc-network.com:7051
peer channel update -o orderer.poc-network.com:7050 -c parentshospital -f ./channel-artifacts/ParentsMSPanchors_parentshospital.tx --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/poc-network.com/orderers/orderer.poc-network.com/msp/tlscacerts/tlsca.poc-network.com-cert.pem

CORE_PEER_LOCALMSPID="HospitalMSP"
CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_HOSPITAL_CA
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/hospital.poc-network.com/users/Admin@hospital.poc-network.com/msp
CORE_PEER_ADDRESS=peer0.hospital.poc-network.com:9051
peer channel update -o orderer.poc-network.com:7050 -c parentshospital -f ./channel-artifacts/HospitalMSPanchors_parentshospital.tx --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/poc-network.com/orderers/orderer.poc-network.com/msp/tlscacerts/tlsca.poc-network.com-cert.pem

# UPDATE PEERS IN parentshospitalkindergarten CHANNEL

CORE_PEER_LOCALMSPID="ParentsMSP"
CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_PARENTS_CA
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/parents.poc-network.com/users/Admin@parents.poc-network.com/msp
CORE_PEER_ADDRESS=peer0.parents.poc-network.com:7051
peer channel update -o orderer.poc-network.com:7050 -c parentshospitalkindergarten -f ./channel-artifacts/ParentsMSPanchors_parentshospitalkindergarten.tx --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/poc-network.com/orderers/orderer.poc-network.com/msp/tlscacerts/tlsca.poc-network.com-cert.pem

CORE_PEER_LOCALMSPID="HospitalMSP"
CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_HOSPITAL_CA
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/hospital.poc-network.com/users/Admin@hospital.poc-network.com/msp
CORE_PEER_ADDRESS=peer0.hospital.poc-network.com:9051
peer channel update -o orderer.poc-network.com:7050 -c parentshospitalkindergarten -f ./channel-artifacts/HospitalMSPanchors_parentshospitalkindergarten.tx --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/poc-network.com/orderers/orderer.poc-network.com/msp/tlscacerts/tlsca.poc-network.com-cert.pem

CORE_PEER_LOCALMSPID="KindergartenMSP"
CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_KINDERGARTEN_CA
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/kindergarten.poc-network.com/users/Admin@kindergarten.poc-network.com/msp
CORE_PEER_ADDRESS=peer0.kindergarten.poc-network.com:9051
peer channel update -o orderer.poc-network.com:7050 -c parentshospitalkindergarten -f ./channel-artifacts/KindergartenMSPanchors_parentshospitalkindergarten.tx --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/poc-network.com/orderers/orderer.poc-network.com/msp/tlscacerts/tlsca.poc-network.com-cert.pem

# INSTALLING SMART CONTRACT ON ORGANISATION'S PEERS
CC_RUNTIME_LANGUAGE=golang
CC_SRC_PATH=github.com/chaincode/poc/
CC_SRC_PATH_2=github.com/chaincode/poc_kinder/
CONFIG_ROOT=/opt/gopath/src/github.com/hyperledger/fabric/peer
PARENTS_MSPCONFIGPATH=${CONFIG_ROOT}/crypto/peerOrganizations/parents.poc-network.com/users/Admin@parents.poc-network.com/msp
PARENTS_TLS_ROOTCERT_FILE=${CONFIG_ROOT}/crypto/peerOrganizations/parents.poc-network.com/peers/peer0.parents.poc-network.com/tls/ca.crt
HOSPITAL_MSPCONFIGPATH=${CONFIG_ROOT}/crypto/peerOrganizations/hospital.poc-network.com/users/Admin@hospital.poc-network.com/msp
HOSPITAL_TLS_ROOTCERT_FILE=${CONFIG_ROOT}/crypto/peerOrganizations/hospital.poc-network.com/peers/peer0.hospital.poc-network.com/tls/ca.crt
KINDERGARTEN_MSPCONFIGPATH=${CONFIG_ROOT}/crypto/peerOrganizations/kindergarten.poc-network.com/users/Admin@kindergarten.poc-network.com/msp
KINDERGARTEN_TLS_ROOTCERT_FILE=${CONFIG_ROOT}/crypto/peerOrganizations/kindergarten.poc-network.com/peers/peer0.kindergarten.poc-network.com/tls/ca.crt
ORDERER_TLS_ROOTCERT_FILE=${CONFIG_ROOT}/crypto/ordererOrganizations/poc-network.com/orderers/orderer.poc-network.com/msp/tlscacerts/tlsca.poc-network.com-cert.pem

# POC CHAINCODE
# Installing smart contract on peer0.parents.poc-network.com
CORE_PEER_LOCALMSPID=ParentsMSP
CORE_PEER_ADDRESS=peer0.parents.poc-network.com:7051
CORE_PEER_MSPCONFIGPATH=${PARENTS_MSPCONFIGPATH}
CORE_PEER_TLS_ROOTCERT_FILE=${PARENTS_TLS_ROOTCERT_FILE}
peer chaincode install -n poc -v 1.0 -p "$CC_SRC_PATH" -l "$CC_RUNTIME_LANGUAGE"

# Installing smart contract on peer1.parents.poc-network.com
CORE_PEER_LOCALMSPID=ParentsMSP
CORE_PEER_ADDRESS=peer1.parents.poc-network.com:8051
CORE_PEER_MSPCONFIGPATH=${PARENTS_MSPCONFIGPATH}
CORE_PEER_TLS_ROOTCERT_FILE=${PARENTS_TLS_ROOTCERT_FILE}
peer chaincode install -n poc -v 1.0 -p "$CC_SRC_PATH" -l "$CC_RUNTIME_LANGUAGE"

# Installing smart contract on peer0.hospital.poc-network.com
CORE_PEER_LOCALMSPID=HospitalMSP
CORE_PEER_ADDRESS=peer0.hospital.poc-network.com:9051
CORE_PEER_MSPCONFIGPATH=${HOSPITAL_MSPCONFIGPATH}
CORE_PEER_TLS_ROOTCERT_FILE=${HOSPITAL_TLS_ROOTCERT_FILE}
peer chaincode install -n poc -v 1.0 -p "$CC_SRC_PATH" -l "$CC_RUNTIME_LANGUAGE"

# Installing smart contract on peer1.hospital.poc-network.com
CORE_PEER_LOCALMSPID=HospitalMSP
CORE_PEER_ADDRESS=peer1.hospital.poc-network.com:10051
CORE_PEER_MSPCONFIGPATH=${HOSPITAL_MSPCONFIGPATH}
CORE_PEER_TLS_ROOTCERT_FILE=${HOSPITAL_TLS_ROOTCERT_FILE}
peer chaincode install -n poc -v 1.0 -p "$CC_SRC_PATH" -l "$CC_RUNTIME_LANGUAGE"

# POC_KINDER CHAINCODE
# Installing smart contract on peer0.parents.poc-network.com
CORE_PEER_LOCALMSPID=ParentsMSP
CORE_PEER_ADDRESS=peer0.parents.poc-network.com:7051
CORE_PEER_MSPCONFIGPATH=${PARENTS_MSPCONFIGPATH}
CORE_PEER_TLS_ROOTCERT_FILE=${PARENTS_TLS_ROOTCERT_FILE}
peer chaincode install -n poc_kinder -v 1.0 -p "$CC_SRC_PATH_2" -l "$CC_RUNTIME_LANGUAGE"

# Installing smart contract on peer1.parents.poc-network.com
CORE_PEER_LOCALMSPID=ParentsMSP
CORE_PEER_ADDRESS=peer1.parents.poc-network.com:8051
CORE_PEER_MSPCONFIGPATH=${PARENTS_MSPCONFIGPATH}
CORE_PEER_TLS_ROOTCERT_FILE=${PARENTS_TLS_ROOTCERT_FILE}
peer chaincode install -n poc_kinder -v 1.0 -p "$CC_SRC_PATH_2" -l "$CC_RUNTIME_LANGUAGE"

# Installing smart contract on peer0.hospital.poc-network.com
CORE_PEER_LOCALMSPID=HospitalMSP
CORE_PEER_ADDRESS=peer0.hospital.poc-network.com:9051
CORE_PEER_MSPCONFIGPATH=${HOSPITAL_MSPCONFIGPATH}
CORE_PEER_TLS_ROOTCERT_FILE=${HOSPITAL_TLS_ROOTCERT_FILE}
peer chaincode install -n poc_kinder -v 1.0 -p "$CC_SRC_PATH_2" -l "$CC_RUNTIME_LANGUAGE"

# Installing smart contract on peer1.hospital.poc-network.com
CORE_PEER_LOCALMSPID=HospitalMSP
CORE_PEER_ADDRESS=peer1.hospital.poc-network.com:10051
CORE_PEER_MSPCONFIGPATH=${HOSPITAL_MSPCONFIGPATH}
CORE_PEER_TLS_ROOTCERT_FILE=${HOSPITAL_TLS_ROOTCERT_FILE}
peer chaincode install -n poc_kinder -v 1.0 -p "$CC_SRC_PATH_2" -l "$CC_RUNTIME_LANGUAGE"

# Installing smart contract on peer0.kindergarten.poc-network.com
CORE_PEER_LOCALMSPID=KindergartenMSP
CORE_PEER_ADDRESS=peer0.kindergarten.poc-network.com:11051
CORE_PEER_MSPCONFIGPATH=${KINDERGARTEN_MSPCONFIGPATH}
CORE_PEER_TLS_ROOTCERT_FILE=${KINDERGARTEN_TLS_ROOTCERT_FILE}
peer chaincode install -n poc_kinder -v 1.0 -p "$CC_SRC_PATH_2" -l "$CC_RUNTIME_LANGUAGE"

# Installing smart contract on peer1.kindergarten.poc-network.com
CORE_PEER_LOCALMSPID=KindergartenMSP
CORE_PEER_ADDRESS=peer1.kindergarten.poc-network.com:12051
CORE_PEER_MSPCONFIGPATH=${KINDERGARTEN_MSPCONFIGPATH}
CORE_PEER_TLS_ROOTCERT_FILE=${KINDERGARTEN_TLS_ROOTCERT_FILE}
peer chaincode install -n poc_kinder -v 1.0 -p "$CC_SRC_PATH_2" -l "$CC_RUNTIME_LANGUAGE"

# INSTANTIATING SMART CONTRACT ON CHANNELS
# Instantiating smart contract on parentshospital
CORE_PEER_LOCALMSPID=ParentsMSP
CORE_PEER_MSPCONFIGPATH=${PARENTS_MSPCONFIGPATH}
peer chaincode instantiate \
    -o orderer.poc-network.com:7050 \
    -C parentshospital \
    -n poc \
    -l "$CC_RUNTIME_LANGUAGE" \
    -v 1.0 \
    -c '{"Args":["a","20"]}' \
    -P "AND('ParentsMSP.member','HospitalMSP.member')" \
    --tls \
    --cafile ${ORDERER_TLS_ROOTCERT_FILE} \
    --peerAddresses peer0.parents.poc-network.com:7051 \
    --tlsRootCertFiles ${PARENTS_TLS_ROOTCERT_FILE}

# Instantiating smart contract on parentshospitalkindergarten
CORE_PEER_LOCALMSPID=ParentsMSP
CORE_PEER_MSPCONFIGPATH=${PARENTS_MSPCONFIGPATH}
peer chaincode instantiate \
    -o orderer.poc-network.com:7050 \
    -C parentshospitalkindergarten \
    -n poc_kinder \
    -l "$CC_RUNTIME_LANGUAGE" \
    -v 1.0 \
    -c '{"Args":["a","20"]}' \
    -P "AND('ParentsMSP.member','HospitalMSP.member','KindergartenMSP.member')" \
    --tls \
    --cafile ${ORDERER_TLS_ROOTCERT_FILE} \
    --peerAddresses peer0.parents.poc-network.com:7051 \
    --tlsRootCertFiles ${PARENTS_TLS_ROOTCERT_FILE}
