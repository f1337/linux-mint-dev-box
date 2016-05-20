# linux-mint-dev-box

A basic Linux Mint setup for software development

![screenshot](screenshot.png)

## Set Dvorak Layout for Login

See http://unix.stackexchange.com/a/136383, but use the following keymap:

`/usr/bin/setxkbmap dvorak`

System Settings > Keyboard > Layouts > Options > Switching to another layout: Choose "Menu"


## Install NVIDIA Drivers

Read https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa.
Replace `nvidia-XXX` below with the version recommended on that page.

```
sudo add-apt-repository -y ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install -y nvidia-prime nvidia-settings nvidia-XXX
```


## Install Broadcom WiFi Drivers

```
sudo apt-get install bcmwl-kernel-source
```


## Fix APM issues

IFF Mint hangs with a black screen on shutdown and/or suspend, try these steps.

https://forums.linuxmint.com/viewtopic.php?t=184734


## Update Mint

Menu > Administration > Update Manager

* Setup local mirrors, then refresh cache
* Update everything, until there is nothing more to update


## Hijack Caps Lock

System Settings > Keyboard > Layouts > Options > Caps Lock key behavior: Choose "Make Caps Lock an additional Ctrl"


## Mac-Style "Super" Shortcuts

TODO: This process can be automated with `dconf-editor`.

To use the <super> (Windows or Command) key for Mac-style shortcuts:

1. If using a Windows keyboard, System Settings > Keyboard > Layouts > Options > Alt/Win Key behavior: Choose "Alt is swapped with Win"
2. System Settings > Keyboard > Shortcuts
  * General
    * Toggle Scale: Ctrl-Down
    * Toggle Expo: Ctrl-Up
    * Cycle through open windows: Super-Tab
    * Cycle backwards through open windows: Shift-Super-Tab
    * Cycle through open windows of the same application: Super-grave
    * Cycle backwards through open windows of the same application: Shift-Super-tilde
  * Windows
    * Minimize window: Super-m
    * Show desktop: Super-F3
    * Tiling and Snapping
      * Push tile left: Ctrl-Alt-Left
      * Push tile right: Ctrl-Alt-Right
      * Push tile up: Ctrl-Alt-Up
      * Push tile down: Ctrl-Alt-Down
  * Workspaces
    * Switch to left workspace: Ctrl-Left
    * Switch to right workspace: Ctrl-Right
    * Direct Navigation
      * Switch to workspace 1: Ctrl-1
      * Switch to workspace 2: Ctrl-2
      * etc., as needed
  * System
    * Log out: Shift-Super-q
    * Shut down: Ctrl-Alt-Super-Eject (use Delete or similar if no eject button on keyboard)
    * Lock Screen: Ctrl-Shift-Eject (use Delete or similar if no eject button on keyboard)
    * Suspend: Alt-Super-Eject (use Delete or similar if no eject button on keyboard)
    * Screenshots and Recording
      * Take a screenshot: Shift-Super-numbersign
      * Take a screenshot of a window: Shift-Super-dollar
  * Custom Shortcuts > Add custom shortcut
    * Name: Force quit
    * Command: /usr/bin/xkill
    * Keyboard bindings: Alt-Super-Escape

`xkill` is a litte different than Force Quit (Mac) or Task Manager (Windows): it provides a graphical 'X' cursor which you then use to left-click on the window you wish to force-quit. It can be canceled with any mouse click other than left.


2. Install AutoKey

TODO: Replace with `sxhkd` (a window-manager agnostic solution that is actively maintained) and `xdotool` (for simulating pass-through shortcuts).

```
sudo apt-get install autokey-gtk
```
3. Open AutoKey, then Edit > Preferences > Choose "Automatically start AutoKey at login"
4. (optional) Delete the pre-installed sample scripts in autokey.
5. File > Quit AutoKey (don't just close the window). Make sure there is no AutoKey tray icon.
6. Copy my autokeys to your autokey config:
```
mkdir ~/.config/autokeys/data/superb
cp autokey/*.py ~/.config/autokey/data/superb/
cp autokey/.* ~/.config/autokey/data/superb/
```
7. Open AutoKey again. Test your new hot keys. Close the window to hide AutoKey while it runs in the background.

Many thanks to Dražen Lučanin for publishing his
[autokey dotfiles](https://github.com/metakermit/dotfiles/tree/master/autokey),
from which these were derived.

cf. [Mac keyboard shortcuts](https://support.apple.com/en-us/HT201236),
[AutoKey Special Keys](https://github.com/autokey/autokey/wiki/Special-Keys)


## Install Terminator

```
sudo apt-get install terminator
sudo apt-get remove gnome-terminal
```

Terminator > Preferences > Profiles > Scrolling
* Scrollback: 3500 lines
* Disable "Scroll on output"


## Instal tig

Command-line git tree tool.

```
sudo apt-get install tig
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


## Instal Workrave

```
sudo apt-get install workrave
```

My configuration:
* 30s micro-breaks every 15m
* 10m rest breaks every 45m; show 4 exercises
* no daily limit


## Install Tor browser

DO NOT USE A THIRD-PARTY PPA TO INSTALL Tor!

1. Download the latest 64-bit installer from https://www.torproject.org/download/download-easy.html.en
2. Install it using `dpkg`:
```
cd ~/Downloads
tar -xvJf tor-browser-linux64-5.5.4_en-US.tar.xz
mv tor-browser_en-US/ ~/.tor-browser_en-US
cd ~/.tor-browser_en-US/
./start-tor-browser.desktop --register-app
```


## Install Chrome

**UPDATE:** Chrome has a habit of pushing Xorg to 100% CPU usage with certain graphics cards, apparently especially in 64-bit environments.
However, it is the only Linux browser supported by Netflix and Amazon Prime Video.

```
sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable
```

Chrome 64-bit on Linux is known to experience random freezes with certain video drivers when hardware acceleration is enabled.
To disable hardware acceleration Chrome > Settings > Advanced > System > uncheck "Use hardware acceleration when available", then restart Chrome.

cf. http://www.phoronix.com/scan.php?page=news_item&px=MTYyMDk, http://www.techsupportforum.com/forums/f64/solved-system-freezing-continuously-while-running-chrome-840698.html#post5291842


## Install Atom and Its Packages

1. Download the latest 64-bit .deb package from https://atom.io/
2. Install it using `dpkg`:
```
cd ~/Downloads
sudo dpkg -i atom-amd64.deb
```
3. Install packages:
```
apm install atom-pair
```
4. Copy my Atom keymap.cson for mac-style command-shortcuts:
```
cp atom/keymap.cson ~/.atom/
```


## Install Slack

Download the latest 64-bit .deb package from https://slack.com/downloads.

```
cd ~/Downloads
sudo dpkg -i slack-desktop-X.X.X-amd64.deb
```


## Remove Pidgin

It's a resource hog. Just remove it.

```
sudo apt-get remove pidgin
```


## Install Skype

```
sudo apt-get install Skype
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


## Install Keybase

```
curl -O https://dist.keybase.io/linux/deb/keybase-latest-amd64.deb \
&& sudo dpkg -i keybase-latest-amd64.deb
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

1. Move the hibernate pkla somewhere safe:
```
mkdir ~/.disable-hibernate
sudo mv /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla ~/.disable-hibernate/
```
2. Reboot and Hibernate should disappear from the various menus.


## A Better Boot Menu

1. Install ReFind:
```
sudo apt-add-repository ppa:rodsmith/refind
sudo apt-get update
sudo apt-get install refind
```
2. `sudo nano /etc/default/grub` to set the grub timeout:
```
GRUB_HIDDEN_TIMEOUT=0.0
GRUB_TIMEOUT=0.0
```
3. `sudo update-grub`


## Install Extra Codecs

```
sudo apt-get install ubuntu-restricted-extras
```


## Install Tomahawk

A better music player.

```
sudo add-apt-repository ppa:tomahawk/ppa
sudo apt-get update
sudo apt-get install tomahawk
```


## Install Steam

1. [Download the Steam .deb](http://store.steampowered.com/about/) (click "Install Steam Now").
2. Open with GDebi Package installer (dpkg)
3. Ignore the warning that an older version is available in a software channel.
4. Click "Install Package".


## Mac-style `open` in Terminal

```
echo "alias 'open'='xdg-open'" >> ~/.bashrc
```


## Yosemite Desktop Backgrounds

```
sudo cp -r /media/mf/Macintosh HD/Library/Desktop\ Pictures /usr/share/backgrounds/osx-yosemite
```
