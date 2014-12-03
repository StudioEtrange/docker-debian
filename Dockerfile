FROM debian:wheezy
MAINTAINER StudioEtrange <nomorgan@gmail.com>

# Debian package & stuff -------------

RUN echo "deb http://http.debian.net/debian wheezy non-free" >> /etc/apt/sources.list \
	&& echo "deb http://http.debian.net/debian wheezy-updates non-free" >> /etc/apt/sources.list

# DEBIAN packages
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
						python \
						supervisor \
						unrar \
						unzip \
						curl \
						nano \
						pwgen \
						wget \
	&& rm -rf /var/lib/apt/lists/*


# SUPERVISOR -------------
COPY supervisord.conf /etc/supervisor/supervisord.conf

# Supervisord web interface -------
EXPOSE 9999