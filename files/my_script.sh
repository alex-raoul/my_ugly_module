#!/bin/bash

adduser myuser --gecos "" --disabled-password

# move to france
sed -i 's/mirrors.kernel.org/ftp.fr.debian.org/g' /etc/apt/sources.list
apt-get update
