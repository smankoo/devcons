#!/usr/bin/env bash
# Syntax: ./docker-redhat.sh <enable non-root docker socket access flag> <source socket> <target socket> <non-root user>

set -e

GIT_MAJOR_VER=$(git --version | cut -d" " -f3 | cut -d"." -f1)

if [ ${GIT_MAJOR_VER} -eq 2 ]; then
    echo "Git v2 already installed. Exiting..."
    exit 0
fi

ENABLE_NONROOT_DOCKER=${1:-"true"}
SOURCE_SOCKET=${2:-"/var/run/docker-host.sock"}
TARGET_SOCKET=${3:-"/var/run/docker.sock"}
NONROOT_USER=${4:-"vscode"}

if [ "$(id -u)" -ne 0 ]; then
    echo 'Script must be run a root. Use sudo or set "USER root" before running the script.'
    exit 1
fi

yum -y remove git*

yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel wget
yum -y install gcc perl-ExtUtils-MakeMaker

cd /usr/src/
wget https://github.com/git/git/archive/v2.23.0.tar.gz -O git.tar.gz
tar -xf git.tar.gz
cd git-*

make prefix=/usr/local all
make prefix=/usr/local install

cd ..
rm -rf /usr/src/git*