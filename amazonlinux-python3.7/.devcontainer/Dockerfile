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
    yum -y install tar sudo wget unzip zip python3 awscli git && \
    yum clean all && \
    rm -rf /var/cache/yum

RUN wget --quiet https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip \
  && unzip terraform_0.12.28_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_0.12.28_linux_amd64.zip

RUN yum -y install gcc openssl-devel bzip2-devel libffi-devel make \
    && cd /usr/src \
    && wget https://www.python.org/ftp/python/3.7.7/Python-3.7.7.tgz \
    && tar xzf Python-3.7.7.tgz \
    && cd Python-3.7.7 \
    && ./configure --enable-optimizations \
    && make altinstall \
    && rm /usr/src/Python-3.7.7.tgz

RUN export PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin" && \
    export PATH="$PATH:$PYTHON_BIN_PATH"

RUN cd /usr/local/bin && \
    ln -s python3.7 python3 && \
    ln -s python3 python && \
    ln -s pip3.7 pip3 && \
    ln -s pip3 pip 
    
RUN pip3 install pipenv 

RUN echo "export PS1=\"\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ \"" >> ~/.bashrc