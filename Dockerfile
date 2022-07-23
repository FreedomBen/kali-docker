FROM docker.io/kalilinux/kali-rolling

# ENV USER_HOME=/home/docker
# 
# # Create docker group/user and disable logins
# RUN addgroup --gid 9999 docker \
#  && adduser --uid 9999 --gid 9999 --disabled-password --gecos "Docker User" --home ${USER_HOME} docker \
#  && usermod -L docker

# Configure apt, install updates and common packages, and clean up apt's cache
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get upgrade --assume-yes \
 && apt-get autoremove --assume-yes \
 && apt-get install --assume-yes --no-install-recommends \
    apt-utils \
    apt-transport-https \
    ca-certificates \
    ca-certificates-java \
    software-properties-common \
    locales \
 && apt-get install --assume-yes --no-install-recommends \
    vim \
    kali-linux-headless \
    gospider \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/ \
 && update-ca-certificates

# Ensure locale is UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8
ENV LC_TYPE    en_US.UTF-8
ENV LANGUAGE   en_US.UTF-8
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen \
 && locale-gen \
 && dpkg-reconfigure locales

# Make space for mount
VOLUME ["/mnt"]

# CMD [ "/bin/bash", "-c", "node bin/server.js" ]

