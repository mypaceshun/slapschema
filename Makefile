SHELL              = bash

DOCKER             = docker
DOCKER_FILE        = ./Dockerfile
DOCKERHUB_USERNAME = mypaceshun
IMAGE_NAME         = ${DOCKERHUB_USERNAME}/slapschema
TAG                = ${shell date +'%Y-%m-%d'}

CMD                =

.PHONY: usage
usage:
	@echo "Usage: ${MAKE} TARGET"
	@echo ""
	@echo "Target:"
	@echo "  build"
	@echo "  run"
	@echo "  clean"

.PHONY: build
build:
	${DOCKER} build --tag "${IMAGE_NAME}:${TAG}" --file ${DOCKER_FILE} .
	${DOCKER} build --tag "${IMAGE_NAME}:latest" --file ${DOCKER_FILE} .

.PHONY: run
run:
	${DOCKER} run -it --rm -v "`pwd`/schema:/root/schema:ro" "${IMAGE_NAME}" ${CMD}

.PHONY: clean
clean:
	${DOCKER} image rm --force "${IMAGE_NAME}:${TAG}"
	${DOCKER} image rm --force "${IMAGE_NAME}"
