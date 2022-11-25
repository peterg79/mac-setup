# mac-setup

## Usage
1. Fork/Clone this repository
1. Make changes to taylor it to your needs
1. run `./setup.sh` to get everything installed

## Validation
1. Signatures in Preview

## User specific configuration

1. `git config push.default current`
1. `git config --global user.name "Your Name"`
1. `git config --global user.email you@example.com`

## SSH config
1. copy `~/.ssh` content
1. double-check `~/.ssh/config`:
```
Host *
    IgnoreUnknown UseKeychain
    UseKeychain yes
    ForwardAgent yes
    IPQoS none
    AddKeysToAgent yes
    ServerAliveInterval 100
    StrictHostKeyChecking no
```

## Passwordless VPN
1. create a file `~/.cisco-auth` containing username and password in separate lines.
1. execute `chmod 0600 ~/.cisco-auth`
1. create passwordless sudo for the vpn executable `/etc/sudoers.d/vpn`:
        `USERNAME    ALL= NOPASSWD: /opt/cisco/anyconnect/bin/vpn`

## Do manual installations / adjustments
1. Install [Live Home 3d](http://belightsoft.s3.amazonaws.com/basket/LiveHome3DPro.dmg)
1. Install [IVMS-4200](https://us.hikvision.com/en/products/logiciel/ivms-4200-series/free-client-software-hikvision-devices-ivms-4200-macos)
1. Install Canon Printer driver: [MF644Cdw](https://www.usa.canon.com/internet/portal/us/home/support/details/printers/color-laser/color-imageclass-mf644cdw/?cm_sp=CSO-_-PFListing-_-MF644Cdw?tab=drivers_downloads)
1. Add Quick View to Finder toolbar
1. Disable duplex printing by default: `sudo cupsctl WebInterface=yes` then go to http://localhost:631
1. Inspect Element in Safari: click on Safari -> Preferences. Click on Advanced. Check the Show Develop menu in menu bar checkbox.
1. Enable file sharing: System Preferences / Sharing / Remote Login
1. Install [HWMonitorSMC2](https://github.com/CloverHackyColor/HWMonitorSMC2)
1. configure iTerm & vim: [configure iterm2 and vim like a pro](https://medium.com/@jeantimex/how-to-configure-iterm2-and-vim-like-a-pro-on-macos-e303d25d5b5c)

## Browser extensions (chrome, vivaldi)
1. [uBlock](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm/related?hl=en)
1. [1Password](https://chrome.google.com/webstore/detail/1password-extension-deskt/aomjjhallfgjeglblehebfpbcfeobpgk?hl=en)
1. cp ~/Library/Application\ Support/Google/Chrome/NativeMessagingHosts/2bua8c4s2c.com.agilebits.1password.json ~/Library/Application\ Support/Vivaldi/NativeMessagingHosts
1. [Evernote Web Clipper](https://chrome.google.com/webstore/detail/evernote-web-clipper/pioclpoplcdbaefihamjohnefbikjilc?hl=en)
1. Add bookmarklet from [DontFuckWithPaste](https://github.com/jswanner/DontFuckWithPaste)

## Order dock icons
`defaults read com.apple.dock persistent-apps | grep file-label | gawk -F= '{print $2}' | sed -e 's,^[ "]*,,g' |  sed -e 's,[ ";]*$,,g' | gawk '{print NR ". " $0}'`

1. Cisco AnyConnect Secure Mobility Client
1. Google Chrome Canary
1. Google Chrome
1. Vivaldi
1. Google Mail
1. Mail
1. Calendar
1. Google Calendar
1. System Preferences
1. Messages
1. iTerm
1. 1Password 6
1. Slack
1. Preview
1. Nest
1. Visual Studio Code
1. Reminders
1. Photos
1. Notes
1. KidsNote

## references
* https://github.com/necolas/dotfiles
* https://sourabhbajaj.com/mac-setup/
* https://github.com/mathiasbynens/dotfiles
* https://about.gitlab.com/blog/2020/04/17/dotfiles-document-and-automate-your-macbook-setup/
* https://www.intego.com/mac-security-blog/unlock-the-macos-docks-hidden-secrets-in-terminal/
