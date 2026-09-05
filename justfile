image := "jahrik/arm-tini"
tag := "latest"

build image_name=image image_tag=tag:
    docker build -t {{ image_name }}:{{ image_tag }} .

push:
    docker push {{ image }}:{{ tag }}
