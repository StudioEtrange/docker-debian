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

* docker-tag:latest ==> latest stable version of debian through this repository
* github-branch:master ==> work in progress based on latest stable debian version available through this repository
* docker-tag:ver connected to github-branch:ver ==> debian version ver

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

	http://localhost:SUPERVISOR_HTTP_WEB/
