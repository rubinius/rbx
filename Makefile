EXES := rubinius/bin/rbx
DIST := dist/*

# Allow override (e.g., `make VERSION=1.2.3`)
VERSION ?= $(shell (git describe --tags 2>/dev/null || echo "develop") | sed 's/^v//')
REVISION ?= $(shell git rev-parse --short HEAD)

.PHONY: help setup config install release test clean all

all:
	@echo Building everything

##@ Dependencies
setup: ## Clone all components
	@echo Setting up all components

config: ## Configure
	@echo Configuring all components

##@ Devolpment
build: ## Build all components
	@echo Building all components

##@ Testing
test: ## Run the tests
	@echo Running all tests

##@ Maintenance
clean: ## Remove all build artifacts
	rm -rf $(EXES) $(DIST)

help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n"} /^[.a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
