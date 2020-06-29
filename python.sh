#/bin/bash

# based on the following guides:
# https://medium.com/@briantorresgil/definitive-guide-to-python-on-mac-osx-65acd8d969d0

source functions.sh

pkg_install brew python
python3 -m pip install --upgrade pip

# Install pipx to manage global packages
python3 -m pip install --user pipx
python3 -m userpath append ~/.local/bin
# Install global packages
python3 -m pipx install flake8
python3 -m pipx install black

pkg_install brew pyenv
pkg_install brew openssl
pkg_install brew readline
pkg_install brew sqlite3
pkg_install brew xz
pkg_install brew zlib

update_profile 'if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi'
