FROM golang:alpine as primeiro_programa

WORKDIR /go/src/app

COPY . .

RUN go env GOARCH
RUN GOARCH=386 CGO_ENABLED=0 go build -a -gcflags=all="-l -B" -ldflags="-w -s" -o /app main.go

FROM scratch

COPY --from=primeiro_programa /app /app

CMD ["/app"]