IMAGE=aws-pytorch

all: build clean import

build:
	docker build -t ${IMAGE} -f Dockerfile .

clean:
	-rm ${IMAGE}.sqsh

import:
	enroot import -o ${IMAGE}.sqsh dockerd://llm-foundry:latest