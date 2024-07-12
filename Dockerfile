FROM golang:1.21-alpine as builder

WORKDIR /app

COPY ./src /app/

RUN go mod init fullcycle

RUN go build -o fullcycle

FROM scratch

COPY --from=builder /app/fullcycle /fullcycle

CMD ["./fullcycle"]
