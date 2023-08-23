ENV_FILE ?= .env
SHELL := /bin/bash
VENV := backend/venv

GREEN=\033[0;32m
YELLOW=\033[0;33m
NOFORMAT=\033[0m

# Add env variables if needed
ifneq (,$(wildcard ${ENV_FILE}))
	include ${ENV_FILE}
    export
endif

default: help

.PHONY: help
#❓ help: @ Displays this message
help: SHELL := /bin/sh
help:
	@echo ""
	@echo "List of available MAKE targets for development usage."
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Examples:"
	@echo ""
	@echo "	make ${GREEN}venv${NOFORMAT}		- Setup an initial virtual env"
	@echo "	make ${GREEN}setup${NOFORMAT}		- Setup requirements, db and third party apps"
	@echo "	make ${GREEN}server${NOFORMAT}		- Start server"
	@echo ""
	@grep -E '[a-zA-Z\.\-]+:.*?@ .*$$' $(firstword $(MAKEFILE_LIST))| tr -d '#'  | awk 'BEGIN {FS = ":.*?@ "}; {printf "${GREEN}%-30s${NOFORMAT} %s\n", $$1, $$2}'
	@echo ""



#💻 server: @ Starts the Django server
server:
	$(PYTHON) ./backend/cultura/manage.py runserver

#⚙️ venv: @  Create and a virtual env
.PHONY: venv
venv:
	python -m venv $(VENV)

#⚙️  venv.activate: @  Make active venv environment
venv.activate:
	source $(VENV)/bin/activate
