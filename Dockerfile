ARG OS="windows"
ARG ARCH="amd64"
FROM quay.io/projectquay/golang:1.22 
WORKDIR /src
COPY  . .
COPY html /var/tmp/html/
EXPOSE 8080
ARG OS
ARG ARCH
RUN GO_ENABLED=0 GOOS=$OS GOARCH=$ARCH go build -o bin/app main.go
