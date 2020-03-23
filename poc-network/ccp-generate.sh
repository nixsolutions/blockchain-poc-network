#!/bin/bash

function one_line_pem {
    echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
}

function json_ccp {
    local PP=$(one_line_pem $6)
    local CP=$(one_line_pem $7)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${ORG_B}/$2/" \
        -e "s/\${P0PORT}/$3/" \
        -e "s/\${P1PORT}/$4/" \
        -e "s/\${CAPORT}/$5/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        ccp-template.json
}

function yaml_ccp {
    local PP=$(one_line_pem $6)
    local CP=$(one_line_pem $7)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${ORG_B}/$2/" \
        -e "s/\${P0PORT}/$3/" \
        -e "s/\${P1PORT}/$4/" \
        -e "s/\${CAPORT}/$5/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        ccp-template.yaml | sed -e $'s/\\\\n/\\\n        /g'
}

ORG_B=Parents
ORG=parents
P0PORT=7051
P1PORT=8051
CAPORT=7054
PEERPEM=crypto-config/peerOrganizations/parents-poc-network-com/tlsca/tlsca.parents-poc-network-com-cert.pem
CAPEM=crypto-config/peerOrganizations/parents-poc-network-com/ca/ca.parents-poc-network-com-cert.pem

echo "$(json_ccp $ORG $ORG_B $P0PORT $P1PORT $CAPORT $PEERPEM $CAPEM)" > connection-parents.json
echo "$(yaml_ccp $ORG $ORG_B $P0PORT $P1PORT $CAPORT $PEERPEM $CAPEM)" > connection-parents.yaml

ORG_B=Hospital
ORG=hospital
P0PORT=9051
P1PORT=10051
CAPORT=8054
PEERPEM=crypto-config/peerOrganizations/hospital-poc-network-com/tlsca/tlsca.hospital-poc-network-com-cert.pem
CAPEM=crypto-config/peerOrganizations/hospital-poc-network-com/ca/ca.hospital-poc-network-com-cert.pem

echo "$(json_ccp $ORG $ORG_B $P0PORT $P1PORT $CAPORT $PEERPEM $CAPEM)" > connection-hospital.json
echo "$(yaml_ccp $ORG $ORG_B $P0PORT $P1PORT $CAPORT $PEERPEM $CAPEM)" > connection-hospital.yaml

ORG_B=Kindergarten
ORG=kindergarten
P0PORT=11051
P1PORT=12051
CAPORT=8056
PEERPEM=crypto-config/peerOrganizations/kindergarten-poc-network-com/tlsca/tlsca.kindergarten-poc-network-com-cert.pem
CAPEM=crypto-config/peerOrganizations/kindergarten-poc-network-com/ca/ca.kindergarten-poc-network-com-cert.pem

echo "$(json_ccp $ORG $ORG_B $P0PORT $P1PORT $CAPORT $PEERPEM $CAPEM)" > connection-kindergarten.json
echo "$(yaml_ccp $ORG $ORG_B $P0PORT $P1PORT $CAPORT $PEERPEM $CAPEM)" > connection-kindergarten.yaml
