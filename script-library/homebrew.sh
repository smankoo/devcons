#!/bin/bash

# Install prerequisites
sudo yum -y groupinstall 'Development Tools'
sudo yum -y install curl file git
sudo yum -y install libxcrypt-compat || true

# Install homebrew
git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
mkdir ~/.linuxbrew/bin
ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
eval $(~/.linuxbrew/bin/brew shellenv)

# Set environment
echo 'eval $(~/.linuxbrew/bin/brew shellenv)' >> .bash_profile
echo 'eval $(~/.linuxbrew/bin/brew shellenv)' >> .profile

brew install gcc

