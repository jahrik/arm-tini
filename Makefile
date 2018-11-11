IMAGE = "jahrik/arm-tini"
ARCH := $(shell uname -m)
TAG = ${ARCH}

all: build

build:
	@docker build -t ${IMAGE}:$(TAG) .
	@docker tag ${IMAGE}:$(TAG) ${IMAGE}:latest

push:
	@docker push ${IMAGE}:$(TAG)
	@docker push ${IMAGE}:latest

.PHONY: all build push
