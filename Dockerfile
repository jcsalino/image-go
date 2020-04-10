FROM golang:1.14-alpine AS builder

WORKDIR /go/src/app
COPY main.go .
RUN go get -d -v ./...
RUN go install -v ./...
RUN go build -o main .

FROM scratch
WORKDIR /go/src/app
COPY --from=builder /go/src/app .

CMD ["./main"]
