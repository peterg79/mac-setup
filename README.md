# mac-setup

## Usage
1. Fork/Clone this repository
1. Make changes to taylor it to your needs
1. run `./setup.sh` to get everything installed

## User specific configuration

1. `git config push.default current`
1. `git config --global user.name "Your Name"`
1. `git config --global user.email you@example.com`
1. install ssh keys to ~/.ssh

## SSH config
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
1. Install AnyConnect VPN: /Library/Application Support/JAMF/Downloads/Cisco_AnyConnect_4.9.04043.pkg.unzip/Cisco_AnyConnect_4.9.04043.pkg
1. create a file `~/.cisco-auth` containing username and password in separate lines.
1. execute `chmod 0600 ~/.cisco-auth`
1. create passwordless sudo for the vpn executable `/etc/sudoers.d/vpn`:
        `USERNAME    ALL= NOPASSWD: /opt/cisco/anyconnect/bin/vpn`

## Do manual installations / adjustments
1. enable file sharing: System Preferences / Sharing / Remote Login
1. install [Live Home 3d](http://belightsoft.s3.amazonaws.com/basket/LiveHome3DPro.dmg)
1. https://www.usa.canon.com/internet/portal/us/home/support/details/printers/color-laser/color-imageclass-mf644cdw/?cm_sp=CSO-_-PFListing-_-MF644Cdw?tab=drivers_downloads
1. Add Quick View to Finder toolbar

## Browser extensions (chrome, vivaldi)
1. https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm/related?hl=en
1. https://chrome.google.com/webstore/detail/1password-extension-deskt/aomjjhallfgjeglblehebfpbcfeobpgk?hl=en
1. cp ~/Library/Application\ Support/Google/Chrome/NativeMessagingHosts/2bua8c4s2c.com.agilebits.1password.json ~/Library/Application\ Support/Vivaldi/NativeMessagingHosts
1. Evernote extension

## Order dock icons
`defaults read com.apple.dock persistent-apps | grep file-label | gawk -F= '{print $2}' | sed -e 's,^[ "]*,,g' |  sed -e 's,[ ";]*$,,g' | gawk '{print NR ". " $0}'`

1. Cisco AnyConnect Secure Mobility Client
2. Google Chrome Canary
3. Google Chrome
4. Vivaldi
5. Google Mail
6. Kiwi for Gmail Lite
7. Mail
8. Calendar
9. Google Calendar
10. System Preferences
11. Messages
12. iTerm
13. 1Password 6
14. Slack
15. Preview
16. Nest
17. Visual Studio Code
18. Reminders
19. Photos
20. Notes
21. KidsNote

## references
* https://github.com/necolas/dotfiles
* https://sourabhbajaj.com/mac-setup/
* https://github.com/mathiasbynens/dotfiles
* https://about.gitlab.com/blog/2020/04/17/dotfiles-document-and-automate-your-macbook-setup/
* https://www.intego.com/mac-security-blog/unlock-the-macos-docks-hidden-secrets-in-terminal/
