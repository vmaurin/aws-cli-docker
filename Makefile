.PHONY: help
help: ## Display this help message
	@grep -E '^[a-zA-Z_-]+:.*## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## Build the necessary docker image
	docker build --pull --build-arg USER_ID="$(shell id -u)" --build-arg GROUP_ID="$(shell id -g)" -t aws-cli .
