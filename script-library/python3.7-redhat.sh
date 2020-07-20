yum update -y && \
yum -y install tar sudo wget unzip zip python3 awscli git && \
yum clean all && \
rm -rf /var/cache/yum

yum -y install gcc openssl-devel bzip2-devel libffi-devel make \
&& cd /usr/src \
&& wget https://www.python.org/ftp/python/3.7.7/Python-3.7.7.tgz \
&& tar xzf Python-3.7.7.tgz \
&& cd Python-3.7.7 \
&& ./configure --enable-optimizations \
&& make altinstall \
&& rm /usr/src/Python-3.7.7.tgz

export PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin" && \
export PATH="$PATH:$PYTHON_BIN_PATH"

cd /usr/local/bin && \
ln -s python3.7 python3 && \
ln -s python3 python && \
ln -s pip3.7 pip3 && \
ln -s pip3 pip

pip3 install pipenv