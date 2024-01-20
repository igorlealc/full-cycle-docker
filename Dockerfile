from golang:latest as builder

run mkdir -p /development/fullcyle-docker-go
workdir /development/fullcyle-docker-go
run go mod init fullcycle/docker-go

copy ./src/ .
run go build

FROM scratch

COPY --from=builder /development/fullcyle-docker-go/docker-go /

ENTRYPOINT ["./docker-go"]