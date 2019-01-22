ARG alpine=3.8
ARG go=1.11.0
ARG protoc_go_gen=1.1.0

FROM golang:$go-alpine$alpine AS build
RUN apk add wget
RUN wget https://github.com/golang/protobuf/archive/v1.1.0.tar.gz -O src.tar.gz
RUN tar xzf src.tar.gz
RUN mkdir -p src/github.com/golang/ && mv protobuf-1.1.0 src/github.com/golang/protobuf
RUN go install github.com/golang/protobuf/protoc-gen-go
