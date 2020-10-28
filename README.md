# mac-setup

## Usage
1. Fork/Clone this repository
1. Make changes to taylor it to your needs
1. run `./setup.sh` to get everything installed

## User specific configuration

1. `git config push.default current`
1. `git config --global user.name "Your Name"`
1. `git config --global user.email you@example.com`

## Passwordless VPN
1. create a file `~/.cisco-auth` containing username and password in separate lines.
1. execute `chmod 0600 ~/.cisco-auth`
1. create passwordless sudo for the vpn executable `/etc/sudoers.d/vpn`:
        `USERNAME    ALL= NOPASSWD: /opt/cisco/anyconnect/bin/vpn`

## Do manual installations / adjustments
1. install [Live Home 3d](http://belightsoft.s3.amazonaws.com/basket/LiveHome3DPro.dmg)

## references
* https://github.com/necolas/dotfiles
* https://sourabhbajaj.com/mac-setup/
* https://github.com/mathiasbynens/dotfiles
* https://about.gitlab.com/blog/2020/04/17/dotfiles-document-and-automate-your-macbook-setup/
* https://www.intego.com/mac-security-blog/unlock-the-macos-docks-hidden-secrets-in-terminal/
