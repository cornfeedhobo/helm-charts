.PHONY: debug

debug:
	@if [ ! -r debug-values.yaml ]; then touch debug-values.yaml; fi
	helm template $(shell basename $${PWD}) . \
		-n bitcoin-system \
		-f debug-values.yaml \
		--debug \
		--api-versions monitoring.coreos.com/v1/ServiceMonitor \
		--namespace $(shell basename $${PWD}) \
		> debug-render.yaml

docs:
	@docker run --rm --volume "$$(pwd):/helm-docs" -u $$(id -u) jnorwood/helm-docs:latest

lint:
	@if [ ! -r debug-values.yaml ]; then touch debug-values.yaml; fi
	helm lint
	helm template $(shell basename $${PWD}) . \
		-n bitcoin-system \
		-f debug-values.yaml \
		--debug \
		--api-versions monitoring.coreos.com/v1/ServiceMonitor \
		--namespace $(shell basename $${PWD}) \
		| kubeconform
