#!/bin/bash

# Install prerequisites
sudo yum -y groupinstall 'Development Tools'
sudo yum -y install curl file git libxcrypt-compat 

# Install homebrew
git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
mkdir ~/.linuxbrew/bin
ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin

# Set environment
echo 'eval $(~/.linuxbrew/bin/brew shellenv)' >> .bash_profile
echo 'eval $(~/.linuxbrew/bin/brew shellenv)' >> .profile
