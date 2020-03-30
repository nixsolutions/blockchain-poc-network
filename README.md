# Network

## Goal

The main goal of the Network is to provide private transactions between network participants. The network is built using the Hyperledger Fabric 1.4 framework.

## Network members

Hyperledger Fabric corporate network members are Parents, Hospital, and Kindergarten. Members of these organizations interact with each other in two channels. The first parentshospital channel is for conducting private transactions between Parents and Hospital organizations. The second channel "parentshospitalkindergarten" is for transactions between all three organizations.

In the parentshospital channel, medical records and agreements between the members of the Parents and Hospital organizations are created, these agreements are signed, and data is entered into the medical records.

The channel parentshospitalkindergarten works with reports that are based on data from medical records.

## Network deployment

The network is installed on 4 servers using Docker Swarm. All servers must have git and docker installed. As a result of further actions, each network component will be installed on each server:

1 server - Orderer, MySQL DB (for storing some information)
2 server - Parents organization (Peer0, Peer1), CouchDB, Fabric-CA, CLI
3 server - Hospital organization (Peer0, Peer1), CouchDB, Fabric-CA
4 server - Kindergarten organization (Peer0, Peer1), CouchDB, Fabric-CA

It is also necessary to put smart contracts on the network. Here are the commands for all four servers:
```
git clone https://gitlab.nixdev.co/poc-blockchain/network.git
cd network && mkdir chaincode && cd chaincode
git clone https://gitlab.nixdev.co/poc-blockchain/smart-contract.git medical-contract
git clone https://gitlab.nixdev.co/poc-blockchain/poc_kinder.git kindergarten-contract
```
On the first server, we will create all the necessary certificates necessary for the operation of our network:
```
cd network/poc-network
./1_generate_connection_files.sh
./2_generating_channel_configuration.sh
```
It is also necessary to copy the resulting channel-artifacts and crypto-config folders to the other three servers.

Creating a Docker Swarm stack begins by initializing it on the first server and creating a join-token for the rest of the servers:
```
docker swarm init
docker swarm join-token manager
```
Now we can attach the rest of the servers to the stack (run on 2, 3 and 4 servers):
```
docker swarm join --token SWMTKN-1-2xzco7t7txohnzd09318eczpbgmm8woex80byxptpt1jl5i2ar-bsg37h40xze1gaabg80i96gw2 172.31.38.245:2377
```
Here it will be necessary to replace the token with the one that appears as a result of the "docker swarm join-token manager" command.

On the first server in the network / poc-network folder there is a file .env.template, in which you need to register hostname for each of the hosts:

ORDERER = ip-172-31-38-245
PARENTS = ip-172-31-43-64
HOSPITAL = ip-172-31-38-130
KINDERGARTEN = ip-172-31-40-157

Next, you need to generate the .env file
```
./3_env_gen.sh
```
## Creating a Swarm Stack
```
env $ (cat .env | grep ^ [A-Z] | xargs) docker stack deploy -c docker-compose-general.yaml stage 2> & 1
```
After the stack is created, you need to go to the docker CLI container on the second server:
```
docker exec -ti stage_cli.1.owni217t53m53efjtikb5oa2f/bin/bash
```
And inside this container, execute all the commands that are contained in the 4_create_channels.sh file at network / poc-network. These commands will create channels, attach all peers to the channel, and establish smart contracts.

For a complete understanding of the role of this application in the Child Medical Record project, refer to the [article](https://www.google.com).