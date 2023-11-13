FROM golang:latest

RUN mkdir /build
WORKDIR /build
RUN apt-get update && \
    apt-get -y install gcc mono-mcs && \
    rm -rf /var/lib/apt/lists/*
RUN export GO111MODULE=on
RUN go get github.com/ybkuroki/go-webapp-sample
RUN cd /build && git clone https://github.com/ybkuroki/go-webapp-sample.git
#RUN cd /build/go-webapp-sample && go build
EXPOSE 8080
RUN cd /build/go-webapp-sample && go build -o go-webapp-sample
#ENTRYPOINT ["/build/go-webapp-sample/go-webapp-sample"]
#CMD ["/build/go-webapp-sample/go-webapp-sample"]
