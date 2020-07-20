#!/usr/bin/env bash
# install.sh

echo -n '- Installing brew ... '
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
#  > /dev/null
if [ $? -eq 0 ]; then echo 'OK'; else echo 'NG'; fi
