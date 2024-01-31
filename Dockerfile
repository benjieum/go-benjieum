# Support setting various labels on the final image
ARG COMMIT=""
ARG VERSION=""
ARG BUILDNUM=""

# Build Gbenji in a stock Go builder container
FROM golang:1.18-alpine as builder

RUN apk add --no-cache gcc musl-dev linux-headers git

# Get dependencies - will also be cached if we won't change go.mod/go.sum
COPY go.mod /go-benjieum/
COPY go.sum /go-benjieum/
RUN cd /go-benjieum && go mod download

ADD . /go-benjieum
RUN cd /go-benjieum && go run build/ci.go install -static ./cmd/gbenji

# Pull Gbenji into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go-benjieum/build/bin/gbenji /usr/local/bin/

EXPOSE 8545 8546 30303 30303/udp
ENTRYPOINT ["gbenji"]

# Add some metadata labels to help programatic image consumption
ARG COMMIT=""
ARG VERSION=""
ARG BUILDNUM=""

LABEL commit="$COMMIT" version="$VERSION" buildnum="$BUILDNUM"
