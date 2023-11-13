FROM golang:latest

WORKDIR /build

# Install necessary dependencies
RUN apt-get update && \
    apt-get -y install gcc mono-mcs && \
    rm -rf /var/lib/apt/lists/*

# Initialize a Go module
RUN go mod init mymodule  # Replace "mymodule" with your desired module name

# Clone your project
RUN git clone https://github.com/ybkuroki/go-webapp-sample.git

# Build the project and install dependencies
RUN export GO111MODULE=on
RUN go install github.com/ybkuroki/go-webapp-sample

# Set the working directory to the project directory
WORKDIR /build/go-webapp-sample

# Expose the port on which your application will run
EXPOSE 8080

# Command to run the executable
CMD ["go-webapp-sample"]
