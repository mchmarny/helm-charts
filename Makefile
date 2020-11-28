.PHONY: all
all: help

.PHONY: helm
helm: ## Install Helm chart
	helm repo add ns-label-operator https://charts.chmarny.dev
	helm repo update

.PHONY: chart
chart: ## Package Helm chart
	helm package ../ns-label-operator/chart/

.PHONY: index
index: ## Indexes Helm charts
	helm repo index . --url https://charts.chmarny.dev

.PHONY: help
help: ## Display available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk \
		'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
