#/bin/bash

# based on the following guides:
# https://medium.com/@briantorresgil/definitive-guide-to-python-on-mac-osx-65acd8d969d0
# more stuff:
# https://github.com/wemake-services/wemake-python-styleguide
# poetry: https://poetry.eustace.io/docs
# pyenv: https://github.com/pyenv/pyenv
# pipx: https://pipxproject.github.io/pipx/
# Python Code Quality: Tools & Best Practices:
# https://realpython.com/python-code-quality/

source globals.sh

echo "Not installing python yet"
function this_needs_work {
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

# raspbian has this version
pyenv install -s 3.7.3
pyenv global 3.7.3

# pipx
update_profile 'export PATH="~/.local/bin:$PATH"'

# poetry
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
update_profile 'export PATH="$HOME/.poetry/bin:$PATH"'
update_profile 'export PIP_REQUIRE_VIRTUALENV=true'
source ~/.bash_profile
poetry config virtualenvs.in-project true
python -c "import this"
}
