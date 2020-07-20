#!/usr/bin/env bash
# install.sh

URL_BREW='https://raw.githubusercontent.com/Homebrew/install/master/install'

echo -n '- Installing ruby (prerequisite for brew) ... '
sudo yum -y install ruby
echo -n '- Installing brew ... '
echo | /usr/bin/ruby -e "$(curl -fsSL $URL_BREW)"
#  > /dev/null
if [ $? -eq 0 ]; then echo 'OK'; else echo 'NG'; fi
