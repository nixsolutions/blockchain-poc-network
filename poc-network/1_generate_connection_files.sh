if [ ! -d channel-artifacts ]; then
    mkdir channel-artifacts
fi

if [ -d crypto-config ]; then
    rm -R crypto-config
fi

#mkdir channel-artifacts
#rm -R crypto-config

../bin/cryptogen generate --config crypto-config.yaml

ORG_B=Parents
ORG=parents
P0PORT=7051
P1PORT=8051
CAPORT=7054
PEERPEM=crypto-config/peerOrganizations/parents.poc-network.com/tlsca/tlsca.parents.poc-network.com-cert.pem
CAPEM=crypto-config/peerOrganizations/parents.poc-network.com/ca/ca.parents.poc-network.com-cert.pem

PP="`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $PEERPEM`"
CP="`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $CAPEM`"

echo "$(
sed -e "s/\${ORG}/$ORG/" \
-e "s/\${ORG_B}/$ORG_B/" \
-e "s/\${P0PORT}/$P0PORT/"  \
-e "s/\${P1PORT}/$P1PORT/" \
-e "s/\${CAPORT}/$CAPORT/"  \
-e "s#\${PEERPEM}#$PP#"  \
-e "s#\${CAPEM}#$CP#" \
./ccp-template.json \
)" > connection-parents.json

echo "$(
sed -e "s/\${ORG}/$ORG/" \
-e "s/\${ORG_B}/$ORG_B/" \
-e "s/\${P0PORT}/$P0PORT/"  \
-e "s/\${P1PORT}/$P1PORT/" \
-e "s/\${CAPORT}/$CAPORT/"  \
-e "s#\${PEERPEM}#$PP#"  \
-e "s#\${CAPEM}#$CP#" \
./ccp-template.yaml \
)" > connection-parents.yaml



ORG_B=Hospital
ORG=hospital
P0PORT=9051
P1PORT=10051
CAPORT=8054
PEERPEM=crypto-config/peerOrganizations/hospital.poc-network.com/tlsca/tlsca.hospital.poc-network.com-cert.pem
CAPEM=crypto-config/peerOrganizations/hospital.poc-network.com/ca/ca.hospital.poc-network.com-cert.pem

PP="`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $PEERPEM`"
CP="`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $CAPEM`"

echo "$(
sed -e "s/\${ORG}/$ORG/" \
-e "s/\${ORG_B}/$ORG_B/" \
-e "s/\${P0PORT}/$P0PORT/"  \
-e "s/\${P1PORT}/$P1PORT/" \
-e "s/\${CAPORT}/$CAPORT/"  \
-e "s#\${PEERPEM}#$PP#"  \
-e "s#\${CAPEM}#$CP#" \
./ccp-template.json \
)" > connection-hospital.json

echo "$(
sed -e "s/\${ORG}/$ORG/" \
-e "s/\${ORG_B}/$ORG_B/" \
-e "s/\${P0PORT}/$P0PORT/"  \
-e "s/\${P1PORT}/$P1PORT/" \
-e "s/\${CAPORT}/$CAPORT/"  \
-e "s#\${PEERPEM}#$PP#"  \
-e "s#\${CAPEM}#$CP#" \
./ccp-template.yaml \
)" > connection-hospital.yaml



ORG_B=Kindergarten
ORG=kindergarten
P0PORT=11051
P1PORT=12051
CAPORT=8056
PEERPEM=crypto-config/peerOrganizations/kindergarten.poc-network.com/tlsca/tlsca.kindergarten.poc-network.com-cert.pem
CAPEM=crypto-config/peerOrganizations/kindergarten.poc-network.com/ca/ca.kindergarten.poc-network.com-cert.pem

PP="`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $PEERPEM`"
CP="`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $CAPEM`"

echo "$(
sed -e "s/\${ORG}/$ORG/" \
-e "s/\${ORG_B}/$ORG_B/" \
-e "s/\${P0PORT}/$P0PORT/"  \
-e "s/\${P1PORT}/$P1PORT/" \
-e "s/\${CAPORT}/$CAPORT/"  \
-e "s#\${PEERPEM}#$PP#"  \
-e "s#\${CAPEM}#$CP#" \
./ccp-template.json \
)" > connection-kindergarten.json

echo "$(
sed -e "s/\${ORG}/$ORG/" \
-e "s/\${ORG_B}/$ORG_B/" \
-e "s/\${P0PORT}/$P0PORT/"  \
-e "s/\${P1PORT}/$P1PORT/" \
-e "s/\${CAPORT}/$CAPORT/"  \
-e "s#\${PEERPEM}#$PP#"  \
-e "s#\${CAPEM}#$CP#" \
./ccp-template.yaml \
)" > connection-kindergarten.yaml
