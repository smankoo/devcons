#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

# Update the VARIANT arg in devcontainer.json to pick an Ubuntu version: focal (or ubuntu-20.04), bionic (or ubuntu-18.04)
# To fully customize the contents of this image, use the following Dockerfile instead:
# https://github.com/microsoft/vscode-dev-containers/tree/v0.128.0/containers/ubuntu/.devcontainer/base.Dockerfile
# ARG VARIANT="focal"
FROM amazonlinux


# ** [Optional] Uncomment this section to install additional packages. **
#
RUN yum update -y && \
    yum -y install tar sudo wget unzip zip python3 python3-venv python3-pip awscli git && \
    yum clean all && \
    rm -rf /var/cache/yum

RUN pip3 install pipenv 

RUN wget --quiet https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip \
  && unzip terraform_0.12.28_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_0.12.28_linux_amd64.zip

RUN echo "export PS1=\"\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ \"" >> ~/.bashrc