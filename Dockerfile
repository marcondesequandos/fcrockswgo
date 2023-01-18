FROM golang:alpine AS build

RUN mkdir /app
WORKDIR /app

COPY main.go /app

RUN go mod init fcrocks
RUN go build -o /app/fcrocks

FROM scratch

COPY --from=build /app/fcrocks /app/fcrocks

ENTRYPOINT ["/app/fcrocks"]