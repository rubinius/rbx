EXES := rubinius/bin/rbx
DIST := dist/*
CXX := clang++

# Allow override (e.g., `make VERSION=1.2.3`)
VERSION ?= $(shell (git describe --tags 2>/dev/null || echo "develop") | sed 's/^v//')
REVISION ?= $(shell git rev-parse --short HEAD)

.PHONY: help setup config build install release test clean all

all: setup config build test

##@ Dependencies
setup: ## Clone all components
	@echo Setting up all components
	@git submodule update --init --recursive
	@./.build2/scripts/setup-build2.sh rbx

config: ## Configure
	@echo Configuring all components
	@./.build2/scripts/config-build2.sh rbx

##@ Devolpment
build: ## Build all components
	@echo Building all components
	b

##@ Testing
test: ## Run the tests
	@echo Running all tests
	b test

##@ Maintenance
clean: ## Remove all build artifacts
	rm -rf $(EXES) $(DIST)

help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n"} /^[.a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
