
include ./hack/help.mk


UID:=$(shell id -u)
GID:=$(shell id -g)
PWD:=$(shell pwd)


.PHONY: setup
setup: ##@setup builds the container image(s) and starts the setup
	docker-compose build
	docker-compose up -d


.PHONY: clean
clean: ##@setup clean setup
	docker-compose down -t 2


.PHONY: cli
cli: ##@setup set up a docker container with mounted source where you can execute all go commands
	# docker run -it --rm -u $(UID):$(GID) -v $(PWD):/source -w /source golang:1.10.3 bash
	docker run -it --rm -v $(PWD):/go/src/go-start -w /go/src/go-start -v $(PWD)/certs:/certs -p 8083:8083 golang:1.13.5 bash


.PHONY: mkdocker
mkdocker: ##@minikube reuse minikube docker env to run docker cmd's | e.g. `make mkdocker ARGS="ps"`
	@eval $$(minikube docker-env) ;\
	docker $(ARGS)


.PHONY: env
env: ##@setup cp .env.template to .env
	cp .env.template .env

