HELM_FLAGS ?=


.PHONY: docs
docs:
	@docker run --rm --volume "$$(pwd):/helm-docs" -u $$(id -u) jnorwood/helm-docs:latest


.PHONY: lint
lint:
	@helm lint ${HELM_FLAGS}


.PHONY: kubeconforms
kubeconform: lint
	@helm template $(shell basename $${PWD}) . \
		--namespace $(shell basename $${PWD}) \
		--api-versions monitoring.coreos.com/v1/PodMonitor \
		--set podMonitor.enabled=true \
		--set persistence.enabled=true \
		--set exporter.enabled=true \
		${HELM_FLAGS} | \
			docker run --rm -i ghcr.io/yannh/kubeconform \
				-summary \
				-schema-location default \
				-schema-location https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/a9b337560d77d5e30321dd917bbc98f891ac0af7/jsonnet/prometheus-operator/podmonitors-crd.json


.PHONY: render
render:
	@helm template $(shell basename $${PWD}) . \
		--namespace $(shell basename $${PWD}) \
		--api-versions monitoring.coreos.com/v1/PodMonitor \
		--debug \
		${HELM_FLAGS} > debug-render.yaml
