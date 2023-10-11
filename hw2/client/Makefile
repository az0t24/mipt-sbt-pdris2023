TAG ?= latest
HUB ?= docker.io/az0t24

.PHONY: docker-build
docker-build:
	docker build . -t ${HUB}/counter-client:${TAG}

.PHONY: docker-push
docker-push:
	docker push ${HUB}/counter-client:${TAG}