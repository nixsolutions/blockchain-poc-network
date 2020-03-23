# Generating Orderer Genesis block
../bin/configtxgen -profile AllOrgsOrdererGenesis -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block





# Generating channel configuration transaction 'parentshospital.tx'
../bin/configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/parentshospital.tx -channelID parentshospital
# Generating anchor peer update for ParentsMSP
../bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/ParentsMSPanchors_parentshospital.tx -channelID parentshospital -asOrg ParentsMSP
# Generating anchor peer update for HospitalMSP
../bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/HospitalMSPanchors_parentshospital.tx -channelID parentshospital -asOrg HospitalMSP



# Generating channel configuration transaction 'parentshospitalkindergarten.tx'
../bin/configtxgen -profile ThreeOrgsChannel -outputCreateChannelTx ./channel-artifacts/parentshospitalkindergarten.tx -channelID parentshospitalkindergarten
# Generating anchor peer update for ParentsMSP
../bin/configtxgen -profile ThreeOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/ParentsMSPanchors_parentshospitalkindergarten.tx -channelID parentshospitalkindergarten -asOrg ParentsMSP
# Generating anchor peer update for HospitalMSP
../bin/configtxgen -profile ThreeOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/HospitalMSPanchors_parentshospitalkindergarten.tx -channelID parentshospitalkindergarten -asOrg HospitalMSP
# Generating anchor peer update for KindergartenMSP
../bin/configtxgen -profile ThreeOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/KindergartenMSPanchors_parentshospitalkindergarten.tx -channelID parentshospitalkindergarten -asOrg KindergartenMSP





## Generating channel configuration transaction 'truetech.tx'
#../bin/configtxgen -profile TruetechChannel -outputCreateChannelTx ./channel-artifacts/truetech.tx -channelID truetech
## Generating anchor peer update for TruetechMSP
#../bin/configtxgen -profile TruetechChannel -outputAnchorPeersUpdate ./channel-artifacts/TruetechMSPanchors_truetech.tx -channelID truetech -asOrg TruetechMSP
## Generating channel configuration transaction 'jollyteam.tx'
#../bin/configtxgen -profile JollyteamChannel -outputCreateChannelTx ./channel-artifacts/jollyteam.tx -channelID jollyteam
## Generating anchor peer update for JollyteamMSP
#../bin/configtxgen -profile JollyteamChannel -outputAnchorPeersUpdate ./channel-artifacts/JollyteamMSPanchors_jollyteam.tx -channelID jollyteam -asOrg JollyteamMSP
## Generating channel configuration transaction 'brutto.tx'
#../bin/configtxgen -profile BruttoChannel -outputCreateChannelTx ./channel-artifacts/brutto.tx -channelID brutto
## Generating anchor peer update for BruttoMSP
#../bin/configtxgen -profile BruttoChannel -outputAnchorPeersUpdate ./channel-artifacts/BruttoMSPanchors_brutto.tx -channelID brutto -asOrg BruttoMSP
