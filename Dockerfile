FROM golang:1.11 AS builder
LABEL version="1.0.0"

#RUN apt-get update  \
#    && apt-get install -y git ca-certificates 


# IN QUESTE DIR CI SONO I MODULI CHE MI SERVONO
COPY helloworld.go helloworld.go

RUN go build -o go-run

FROM openshift/origin-base 

COPY --from=builder go-run /root/go-run 
run  chown -R 1001:0 /root/go-run && \
     chmod -R g+rw   /root/go-run

#ENTRYPOINT ["$HOME/go-run"]
CMD ["/root/go-run"]

