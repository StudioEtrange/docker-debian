# docker debian

* based on offical docker debian
* Add support of supervisor to manage process - add your *.conf files into /etc/supervisor/
* Python installed

## Sample Usage

for running debian latest :

	docker run -i -t studioetrange/docker-debian:latest

for running debian wheezy :

	docker run -i -t studioetrange/docker-debian:wheezy

## Version and Tag

* Each tag is a different version of debian
* latest is the latest stable version of debian

## Instruction 

### build from github source

	git pull https://github.com/StudioEtrange/docker-debian
	cd docker-debian
	docker build -t=studioetrange/docker-debian .

### retrieve image from docker registry

	docker pull studioetrange/docker-debian

### run a command

	docker run -i -t -p SUPERVISOR_HTTP_WEB:9999 studioetrange/docker-debian:DEBIAN_VERSION COMMAND

## Access point

### Supervisor

	Go to http://localhost:SUPERVISOR_HTTP_WEB/
