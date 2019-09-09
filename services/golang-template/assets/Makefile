PROJECT_NAME := "{{PROJECT}}"
PKG := "github.com/{{GITHUB_ORG}}/$(PROJECT_NAME)"
PKG_LIST := $(shell go list ${PKG}/... | grep -v /vendor/)
GO_FILES := $(shell find . -name '*.go' | grep -v /vendor/ | grep -v _test.go)

.PHONY: all dep lint vet test snapshot release clean

all: help

dep: ## Get the dependencies
	@go mod download

lint: ## Lint Golang files
	@golint -set_exit_status ${PKG_LIST}

vet: ## Run go vet
	@go vet ${PKG_LIST}

test: ## Run unittests
	@go test -short ${PKG_LIST}

snapshot: dep ## Build the binary files
	@goreleaser --snapshot --skip-publish --rm-dist

release: ## Build and publish a full release
	@echo "building ${BIN_NAME} ${VERSION} $(GIT_COMMIT)"
	@goreleaser --rm-dist

clean: ## Remove current build
	@rm -f $(PROJECT_NAME)/dist

help: ## Display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
