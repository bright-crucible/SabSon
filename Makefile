.PHONY: backup build logs start stop status sabshell sonshell radshell lidshell hydrashell tail

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
	@echo " lidshell   - launch shell in Lidarr container"
	@echo " hydrashell - launch shell in NZBHydra2 container"
	@echo " plexshell  - launch shell in Plex container"
	@echo " jellyshell - launch shell in Jellyfin container"
	@echo " start      - launch the container(s)"
	@echo " stop       - stop container(s)"

build:
	@bin/build

logs:
	docker compose logs

start:
	@bin/start

stop:
	@bin/stop

status:
	docker compose ps

sabshell:
	@bin/sab_shell

sonshell:
	@bin/son_shell

radshell:
	@bin/rad_shell

lidshell:
	@bin/lid_shell

hydrashell:
	@bin/hydra_shell

plexshell:
	@bin/plex_shell

jellyshell:
	@bin/jelly_shell

tail:
	docker compose logs -f
