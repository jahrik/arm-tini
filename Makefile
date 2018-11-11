IMAGE = "jahrik/arm-tini"
TAG := $(shell uname -m)

all: build

build:
	@docker build --build-arg tag=${TAG} -t ${IMAGE}:$(TAG) .
	@docker tag ${IMAGE}:$(TAG) ${IMAGE}:latest
	docker build -t my_docker .  

push:
	@docker push ${IMAGE}:$(TAG)
	@docker push ${IMAGE}:latest

.PHONY: all build push
