# Makefile for Nginx Hello World App

# Variables
IMAGE_NAME = nginx-teste
CONTAINER_NAME = nginx-teste-container
PORT = 8080

# Build the Docker image
.PHONY: build
build:
	@echo "Building Docker image..."
	docker build -t $(IMAGE_NAME) .

# Run the container
.PHONY: run
run: build
	@echo "Running container on port $(PORT)..."
	docker run --rm --name $(CONTAINER_NAME) -p $(PORT):80 $(IMAGE_NAME)
	@echo "Application is running at http://localhost:$(PORT)"

# Clean up (remove container and image)
.PHONY: clean
clean: stop
	@echo "Removing Docker image..."
	-docker rmi $(IMAGE_NAME)

# Restart the application
.PHONY: restart
restart: stop build run

# Open shell in running container
.PHONY: shell
shell:
	docker exec -it $(CONTAINER_NAME) /bin/sh
