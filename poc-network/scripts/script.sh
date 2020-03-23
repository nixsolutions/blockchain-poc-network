#!/bin/bash

echo
echo " ____    _____      _      ____    _____ "
echo "/ ___|  |_   _|    / \    |  _ \  |_   _|"
echo "\___ \    | |     / _ \   | |_) |   | |  "
echo " ___) |   | |    / ___ \  |  _ <    | |  "
echo "|____/    |_|   /_/   \_\ |_| \_\   |_|  "
echo
echo "Build your first network (BYFN) end-to-end test"
echo
CHANNEL_ALL="$1"
DELAY="$2"
LANGUAGE="$3"
TIMEOUT="$4"
VERBOSE="$5"
NO_CHAINCODE="$6"
CHANNEL_TWO="$7"
: ${CHANNEL_ALL:="parentshospitalkindergarten"}
: ${DELAY:="3"}
: ${LANGUAGE:="golang"}
: ${TIMEOUT:="10"}
: ${VERBOSE:="false"}
: ${NO_CHAINCODE:="false"}
: ${CHANNEL_TWO:="parentshospital"}
LANGUAGE=`echo "$LANGUAGE" | tr [:upper:] [:lower:]`
COUNTER=1
MAX_RETRY=10

CC_SRC_PATH="github.com/chaincode/poc/"

#if [ "$LANGUAGE" = "node" ]; then
#	CC_SRC_PATH="/opt/gopath/src/github.com/chaincode/chaincode_example02/node/"
#fi
#
#if [ "$LANGUAGE" = "java" ]; then
#	CC_SRC_PATH="/opt/gopath/src/github.com/chaincode/chaincode_example02/java/"
#fi

echo "Channel name : "$CHANNEL_ALL
echo "Channel name : "$CHANNEL_TWO

# import utils
. scripts/utils.sh

createChannel() {
	setGlobals 0 "parents"

	if [ -z "$CORE_PEER_TLS_ENABLED" -o "$CORE_PEER_TLS_ENABLED" = "false" ]; then
                set -x
		peer channel create -o orderer.poc-network.com:7050 -c $CHANNEL_ALL -f ./channel-artifacts/parentshospitalkindergarten.tx >&log.txt
		res=$?
                set +x
	else
				set -x
		peer channel create -o orderer.poc-network.com:7050 -c $CHANNEL_ALL -f ./channel-artifacts/parentshospitalkindergarten.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA >&log.txt
		res=$?
				set +x
	fi
	cat log.txt
	verifyResult $res "Channel creation failed"
	echo "===================== Channel '$CHANNEL_ALL' created ===================== "

	if [ -z "$CORE_PEER_TLS_ENABLED" -o "$CORE_PEER_TLS_ENABLED" = "false" ]; then
                set -x
		peer channel create -o orderer.poc-network.com:7050 -c $CHANNEL_TWO -f ./channel-artifacts/parentshospital.tx >&log.txt
		res=$?
                set +x
	else
				set -x
		peer channel create -o orderer.poc-network.com:7050 -c $CHANNEL_TWO -f ./channel-artifacts/parentshospital.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA >&log.txt
		res=$?
				set +x
	fi
	cat log.txt
	verifyResult $res "Channel creation failed"
	echo "===================== Channel '$CHANNEL_TWO' created ===================== "

	echo
}

joinChannel () {
	for org in parents hospital kindergarten; do
	    for peer in 0 1; do
		joinChannelWithRetry $peer $org $CHANNEL_ALL
		echo "===================== peer${peer}.${org} joined channel '$CHANNEL_ALL' ===================== "
		sleep $DELAY
		echo
	    done
	done

	for org in parents hospital; do
	    for peer in 0 1; do
		joinChannelWithRetry $peer $org $CHANNEL_TWO
		echo "===================== peer${peer}.${org} joined channel '$CHANNEL_TWO' ===================== "
		sleep $DELAY
		echo
	    done
	done
}

## Create channel
echo "Creating channel..."
createChannel

## Join all the peers to the channel
echo "Having all peers join the channel..."
joinChannel

## Set the anchor peers for each org in the channel
echo "Updating anchor peers for parents..."
updateAnchorPeers 0 "parents" $CHANNEL_ALL
echo "Updating anchor peers for hospital..."
updateAnchorPeers 0 "hospital" $CHANNEL_ALL
echo "Updating anchor peers for kindergarten..."
updateAnchorPeers 0 "kindergarten" $CHANNEL_ALL

echo "Updating anchor peers for parents..."
updateAnchorPeers 0 "parents" $CHANNEL_TWO
echo "Updating anchor peers for hospital..."
updateAnchorPeers 0 "hospital" $CHANNEL_TWO

echo
echo "========= All GOOD, BYFN execution completed =========== "
echo

echo
echo " _____   _   _   ____   "
echo "| ____| | \ | | |  _ \  "
echo "|  _|   |  \| | | | | | "
echo "| |___  | |\  | | |_| | "
echo "|_____| |_| \_| |____/  "
echo

exit 0
