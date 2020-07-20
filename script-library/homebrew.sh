#!/bin/bash

# Install prerequisites
sudo yum -y groupinstall 'Development Tools'
sudo yum -y install curl file git
sudo yum -y install libxcrypt-compat || true

# Install homebrew
export CI=1
/bin/bash -c "$(echo -e "\r\n" | curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval $(~/.linuxbrew/bin/brew shellenv)

# Set environment
echo 'eval $(~/.linuxbrew/bin/brew shellenv)' >> .bash_profile
echo 'eval $(~/.linuxbrew/bin/brew shellenv)' >> .profile

brew install gcc
