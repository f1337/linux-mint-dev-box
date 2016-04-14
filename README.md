# linux-mint-dev-box

A basic Linux Mint setup for software development

## Set Dvorak Layout for Login

See http://unix.stackexchange.com/a/136383, but use the following keymap:

`/usr/bin/setxkbmap dvorak`


## Install NVIDIA Drivers

Read https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa.
Replace `nvidia-XXX` below with the version recommended on that page.

```
sudo add-apt-repository -y ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install -y nvidia-settings nvidia-XXX
```


## Fix APM issues

IFF Mint hangs with a black screen on shutdown and/or suspend, try these steps.

https://forums.linuxmint.com/viewtopic.php?t=184734


## Update Mint

Menu > Administration > Update Manager

* Setup local mirrors, then refresh cache
* Update everything, until there is nothing more to update


## Swap Left Alt and Control

WIP.
Ideally I'd like to remap the Super (Windows) key w/ custom shortcuts instead.

```
nano ~/.Xmodmap
```

In nano, past the following:

```
clear control
clear mod1
keycode 37 = Alt_L Meta_L
keycode 64 = Control_L
add control = Control_L Control_R
add mod1 = Alt_L Meta_L
```

Save the file, then `xmodmap ~/.Xmodmap`


### TODO

#### custom

Super+c => Ctrl+Insert
Super+v => Shift+Insert
Super+x => Shift+Delete
Super+g => F3
Super+shift+g => Shift-F3
Super+w => Close Window
Super+m => Minimize Window
Super-Tab => Alt tab
Super-q => quit
Super-rtarrow => End
Super-lftarrow => Home
Super-uparrow => pageup
Super-downarrow => pagedown


#### alias to ctrl-command?

Super-a
Super-f
Super-n
Super-z & Super-shift-z





## Install Terminator

```
sudo apt-get install terminator
```


## Setup Mouse Natural Scrolling

```
sudo nano /usr/share/X11/xorg.conf.d/50-natural-scrolling.conf
```

In nano, paste the following:

```
Section "InputClass"
        Identifier "natural scrolling for mouse wheel"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Driver "mouse"
        Option "Device" "/dev/input/mice"
        Option "Protocol" "Auto"
        Option "ZAxisMapping" "5 4"
EndSection
```

Save and reboot.

cf. http://askubuntu.com/questions/137444/is-there-anyway-to-enable-system-wide-inverse-scrolling/519859#519859
cf. https://bugs.chromium.org/p/chromium/issues/detail?id=582547


## Dock and Panel Magic

Right-click the bottom panel > Modify Panel > Move Panel, then drag the panel to the top of the screen.

```
sudo apt-get install cairo-dock
```

After cairo-dock is installed and running, remove the task windows applet from the top panel.



## Install Synapse

```
sudo add-apt-repository ppa:synapse-core/testing
sudo apt-get update
sudo apt-get install synapse
```


## Install Chrome

Download the latest 64-bit .deb package from from https://www.google.com/chrome/browser.

```
cd ~/Downloads
sudo dpkg -i google-chrome-stable_current_amd64.deb
```


## Install Atom

Download the latest 64-bit .deb package from https://atom.io/

```
cd ~/Downloads
sudo dpkg -i atom-amd64.deb
```


## Install Slack

Download the latest 64-bit .deb package from https://slack.com/downloads.

```
cd ~/Downloads
sudo dpkg -i slack-desktop-X.X.X-amd64.deb
```


## Install VirtualBox

```
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian trusty contrib"
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install dkms virtualbox-5.0
```

## Install Vagrant

Download the latest 64-bit .deb package from https://www.vagrantup.com/downloads.html.

```
cd ~/Downloads
sudo dpkg -i vagrant_X.X.X_x86_64.deb
```


## Install Dropbox

Download the latest 64-bit .deb package from https://www.dropbox.com/install.

```
cd ~/Downloads
sudo dpkg -i dropbox_X.X.X_amd64.deb
```


## Install 1Password (Wine)

Follow the directions here: https://support.1password.com/1password-in-wine/


## Install MS Fonts

Linux fonts are pretty rough to look at all day. This will install some MS True Type fonts. It is still up to the reader to apply the fonts where desired (Terminator, etc).

```
sudo apt-get install ttf-mscorefonts-installer
```


## Enable Firewall

```
sudo ufw enable
```


## Disable Hibernation

TODO


## Beautify Grub

TODO
