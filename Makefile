PYTHON3 ?= python3.7

.PHONY: default
default:
	@echo ">>> Running Tests"
	@echo
	@echo "USAGE: make test-all|test-all-requirements|test|test-requirements [PYTHON3=$(PYTHON3)]"

.PHONY: test-all
test-all: test
	make test -C ansible
	make test -C aws

.PHONY: test-all-requirements
test-all-requirements: test-requirements
	make test-requirements -C ansible
	make test-requirements -C aws

.PHONY: test
test: yamllint

.PHONY: test-requirements
test-requirements:
	"$(PYTHON3)" -m pip install -r test-requirements.txt --disable-pip-version-check

.PHONY: yamllint
yamllint:
	yamllint *.yml
