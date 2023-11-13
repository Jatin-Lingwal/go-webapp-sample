FROM golang:latest

WORKDIR /app

# Install necessary dependencies
RUN apt-get update && \
    apt-get -y install gcc mono-mcs && \
    rm -rf /var/lib/apt/lists/*

# Clone your project into the image
RUN git clone https://github.com/ybkuroki/go-webapp-sample.git .

# Build the project
RUN go build -o go-webapp-sample .

# Expose the port on which your application will run
EXPOSE 8080

# Command to run the executable
CMD ["./go-webapp-sample"]
