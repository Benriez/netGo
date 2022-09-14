FROM golang:1.19.1-bullseye AS builder

# Create and change to the app directory.
WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

# Copy local code to the container image.
COPY . ./
WORKDIR /app/examples/server
# Build the binary.
RUN go build

EXPOSE 8880/udp
EXPOSE 40000/udp

CMD [ "./server" ]


