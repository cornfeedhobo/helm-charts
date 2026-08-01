.PHONY: help
help:
	@echo 'Please choose a valid make target'


.PHONY: lint
lint:
	ct lint --all --validate-maintainers=false
