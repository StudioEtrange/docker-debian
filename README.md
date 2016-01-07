# docker debian

* based on offical docker debian
* Add support of supervisor to manage process - add your *.conf files into /etc/supervisor/
* Python installed

## Sample Usage

to run latest debian version :

	docker run -i -t studioetrange/docker-debian:latest


## Docker tags

Available tag for studioetrange/docker-debian:__TAG__

	latest, stable, wheezy, jessie, stretch, sid

The docker-debian:latest tag will always point to the latest stable release of debian

## Instruction

### build from github source

	git pull https://github.com/StudioEtrange/docker-debian
	cd docker-debian
	docker build -t=studioetrange/docker-debian .

### retrieve image from docker registry

	docker pull studioetrange/docker-debian

### run a command

	docker run -i -t -p SUPERVISOR_HTTP_WEB:9999 studioetrange/docker-debian:DEBIAN_VERSION COMMAND

### run a shell inside this container

	docker run -i -t studioetrange/docker-debian bash


## Access point

### Supervisor

	http://localhost:SUPERVISOR_HTTP_WEB/


## Notes on Github / Docker Hub Repository

* This github repository is linked to an automated build in docker hub registry.

	https://hub.docker.com/r/studioetrange/docker-debian/

* _update.sh_ is only an admin script which update and add new versions. This script do not auto create missing tag in docker hub webui. It is only for admin/owner purpose.

