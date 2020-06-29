#/bin/bash

# based on the following guides:
# https://medium.com/@briantorresgil/definitive-guide-to-python-on-mac-osx-65acd8d969d0


# Install both python 3.x and 2.x
brew install python
brew install python@2

# Install pipx to manage global packages
python3 -m pip install --user pipx
python3 -m userpath append ~/.local/bin
# Install global packages
python3 -m pipx install flake8
python3 -m pipx install black

brew install pyenv
brew install openssl readline sqlite3 xz zlib

source functions.sh
update_profile 'if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi'
