#!/bin/bash

adduser myuser --gecos "" --disabled-password
echo 'set background=dark' > /root/.vimrc
echo 'set number' >> /root/.vimrc

echo 'set background=dark' > /home/myuser/.vimrc
echo 'set number' >> /home/myuser/.vimrc
chown myuser /home/myuser/.vimrc

sed -i 's/mirrors.kernel.org/ftp.fr.debian.org/g' /etc/apt/sources.list
apt-get update