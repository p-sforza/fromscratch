FROM golang:1.11 AS builder
LABEL version="1.0.0"

COPY helloworld.go helloworld.go

RUN pwd && ls -lai
RUN go build -o go-run
RUN pwd && ls -lai

FROM scratch
COPY --from=builder /go/go-run go-run 
RUN  chown -R 1001:0 go-run && \
     chmod -R g+rw   go-run

#ENTRYPOINT ["$HOME/go-run"]
CMD ["go-run"]

