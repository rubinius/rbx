PROJ = rbx

SUBMODULE_PATH = ./.build2/scripts

# Allow override (e.g., `make VERSION=1.2.3`)
VERSION ?= $(shell (git describe --tags 2>/dev/null || echo "develop") | sed 's/^v//')
REVISION ?= $(shell git rev-parse --short HEAD)

.PHONY: help setup config build install release test clean all

all: setup config build test

##@ Dependencies
$(SUBMODULE_PATH):
	@echo Syncing git submodule
	@git submodule update --init --recursive

setup: $(SUBMODULE_PATH) ## Clone all components
	@./.build2/scripts/setup-build2.sh $(PROJ)

config: ## Configure
	@./.build2/scripts/config-build2.sh $(PROJ)

##@ Development
build: ## Build all components
	@./.build2/scripts/build-build2.sh $(PROJ)

##@ Testing
test: ## Run the tests
	@./.build2/scripts/test-build2.sh $(PROJ)

##@ Maintenance
clean: ## Remove all build artifacts
	@./.build2/scripts/clean-build2.sh $(PROJ)

help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n"} /^[.a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
