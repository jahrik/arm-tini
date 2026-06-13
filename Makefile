.EXPORT_ALL_VARIABLES:
IMAGE = "jahrik/arm-tini"
TAG = latest

all: build

build:
	@docker build -t ${IMAGE}:$(TAG) .

push:
	@docker push ${IMAGE}:$(TAG)

.PHONY: all build push
