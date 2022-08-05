FROM golang:1.18.5-alpine3.16

WORKDIR /app

COPY go.mod /app
COPY go.sum /app

RUN go mod download && go mod verify

COPY . /app

RUN go build -o hw

EXPOSE 8080

ENTRYPOINT ["/app/hw"]
