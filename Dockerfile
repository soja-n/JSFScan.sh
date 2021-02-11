#FROM ubuntu:latest
FROM golang:latest
MAINTAINER bolli95 "maxlukasboll@gmail.com"

# first set the right working dir
WORKDIR /root

# copy all files to the container
COPY . .

# install all depedencies
RUN chmod +x ./install.sh
RUN apt -y update && apt -y install git wget python3 python3-pip
RUN ./install.sh
ENV HOME /root
ENV GOPATH=$HOME/go/bin
ENV PATH $PATH:$GOPATH
ENV TARGET Panda.ru
RUN echo "$TARGET" > target.txt

CMD ["/bin/bash", "./JSFScan.sh", "-l", "target.txt", "-all", "-r", "-o", "$TARGET"]
#bash ./JSFScan.sh -l target.txt --all -r -o Pandao.ru