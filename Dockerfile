FROM golang:1.11 AS builder
LABEL version="1.0.0"

COPY helloworld.go /root/helloworld.go

RUN cd /root 
RUN go build -o go-run
RUN pwd && ls -lai

FROM openshift/origin-base 
COPY --from=builder /root/go-run /root/go-run 
RUN  chown -R 1001:0 /root/go-run && \
     chmod -R g+rw   /root/go-run

#ENTRYPOINT ["$HOME/go-run"]
CMD ["/root/go-run"]

