.PHONY: debug

debug:
	helm template $(shell basename $${PWD}) . \
		-f debug-values.yaml \
		--debug \
		--api-versions monitoring.coreos.com/v1/ServiceMonitor \
		--namespace bitcoin-system \
		> debug-render.yaml
