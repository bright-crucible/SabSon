.PHONY: backup build logs start stop status sabshell sonshell venv

COMPOSE="venv/bin/docker-compose"

help:
	@echo "SABnzbd and Sonarr in containers!"
	@echo ""
	@echo "Commands:"
	@echo ""
	@echo " build      - build docker images locally"
	@echo " help       - print this help"
	@echo " logs       - print container logs"
	@echo " status     - show running container ps info"
	@echo " sabshell   - launch shell in SABnzbd container"
	@echo " sonshell   - launch shell in Sonarr container"
	@echo " radshell   - launch shell in Radarr container"
	@echo " start      - launch the container(s)"
	@echo " stop       - stop container(s)"
	@echo " venv       - first time use to setup virtual env"

build:
	@bin/build

logs:
	@$(COMPOSE) logs

start:
	@bin/start

stop:
	@bin/stop

status:
	@$(COMPOSE) ps

sabshell:
	@bin/sab_shell

sonshell:
	@bin/son_shell

tail:
	@$(COMPOSE) logs -f

venv:
	@bin/build_virtualenv
