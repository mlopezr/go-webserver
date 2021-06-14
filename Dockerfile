# STEP 1 build executable binary
FROM golang:1.14 AS builder
RUN mkdir -p /go/src/app
WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -a -o /bin/app

# STEP 2 build a small image
FROM gcr.io/distroless/static-debian10 
WORKDIR /bin/
COPY --from=builder /bin/app .
EXPOSE 8080
ENTRYPOINT ["/bin/app"]
