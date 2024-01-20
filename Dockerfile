from golang:latest as builder

run mkdir -p /development/fullcyle-go
workdir /development/fullcyle-go
run go mod init example/hello

copy ./src/ .
run go build

FROM scratch

COPY --from=builder /development/fullcyle-go/hello /

ENTRYPOINT ["./hello"]