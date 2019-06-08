FROM golang:1.11 as builder
LABEL version="1.0.0"

#RUN apt-get update  \
#    && apt-get install -y git ca-certificates 


# IN QUESTE DIR CI SONO I MODULI CHE MI SERVONO
COPY helloworld.go helloworld.go

RUN go build -o go-run

#FROM scratch
FROM openshift/origin-base 

COPY --from=builder go-run $HOME/go-run

#ENTRYPOINT ["$HOME/go-run"]
CMD ["$HOME/go-run"]

