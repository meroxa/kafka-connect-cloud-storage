REPO ?= foodchaintech

default: build push

.PHONY: build
build:
	docker build -t ${REPO}/kafka-connect-cloud-storage:latest .

.PHONY: push
push:
	docker push ${REPO}/kafka-connect-cloud-storage:latest
