FROM ubuntu:20.04

RUN apt update -y && apt install wget curl -y
RUN wget -P /bsc https://github.com/$(curl -s -L https://github.com/bnb-chain/bsc/releases/latest | egrep -o '/bnb-chain/bsc/releases/download/v(.*)/geth_linux')
RUN mv /bsc/geth_linux /bsc/geth && chmod +x /bsc/geth

WORKDIR /bsc

COPY genesis.json /bsc

ENTRYPOINT [ "/bsc/geth" ]
