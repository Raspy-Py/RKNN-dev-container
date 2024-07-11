.PHONY: build start stop

# Docker image name
IMAGE_NAME = rknn_environment

# Container name
CONTAINER_NAME = rknn_container

# Host directory to bind
HOST_DIR = $(PWD)/shared

# Container directory to bind
CONTAINER_DIR = /app/shared

build:
	docker build -t $(IMAGE_NAME) .

start:
	docker run -it --name $(CONTAINER_NAME) \
		-v $(HOST_DIR):$(CONTAINER_DIR) \
		$(IMAGE_NAME)

stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)