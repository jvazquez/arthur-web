DOCKER = $(shell which docker)
BUILD_ARG = $(if $(filter  $(NOCACHE), 1),--no-cache)
NETWORK_NAME?=arthur_network
USERID?=$(shell id -u)
GROUPID?=$(shell id -g)

.PHONY: all test_image migration_image boiler_image

network:
	$(DOCKER) network inspect $(NETWORK_NAME) > /dev/null 2>&1 || $(DOCKER) network create $(NETWORK_NAME)
web_image:
	$(DOCKER) build $(BUILD_ARG) -f Dockerfile \
		-t arthur-api .
