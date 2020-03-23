BYFN_CA1_PRIVATE_KEY=$(cd crypto-config/peerOrganizations/parents.poc-network.com/ca && ls *_sk)
BYFN_CA2_PRIVATE_KEY=$(cd crypto-config/peerOrganizations/hospital.poc-network.com/ca && ls *_sk)
BYFN_CA3_PRIVATE_KEY=$(cd crypto-config/peerOrganizations/kindergarten.poc-network.com/ca && ls *_sk)

echo "$(
sed -e "s/\${BYFN_CA1_PRIVATE_KEY_VALUE}/$BYFN_CA1_PRIVATE_KEY/" \
-e "s/\${BYFN_CA2_PRIVATE_KEY_VALUE}/$BYFN_CA2_PRIVATE_KEY/" \
-e "s/\${BYFN_CA3_PRIVATE_KEY_VALUE}/$BYFN_CA3_PRIVATE_KEY/" \
-e "s/\${P1PORT}/$P1PORT/" \
./.env.template \
)" > .env
