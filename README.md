# linux-mint-dev-box

A basic Linux Mint setup for software development

![screenshot](screenshot.png)


## TODO: Reorganize this doc

This document has been updated on-the-fly and is unorganized. Reorganization thoughts:

* Development Tools
* Gaming
* Mac-influences
* Dvorak
* Automate setup with Puppet


## git 2.x

The default version of git for Ubuntu 14.04 is 1.9.1.
git 2.x provides automatic commit signing, among other improvements.

```
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git
```


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


## Mac-Style Meta Shortcuts

TODO: This process can be automated with `dconf-editor`.

To use the <alt> or <super> (Windows or Command) key for Mac-style shortcuts:

1. If using a Mac keyboard, System Settings > Keyboard > Layouts > Options > Alt/Win Key behavior: Choose "Alt is swapped with Win"
2. System Settings > Keyboard > Shortcuts
  * General
    * Toggle Scale: Ctrl-Down
    * Toggle Expo: Ctrl-Up
    * Cycle through open windows: Alt-Tab
    * Cycle backwards through open windows: Shift-Alt-Tab
    * Cycle through open windows of the same application: Alt-grave
    * Cycle backwards through open windows of the same application: Shift-Alt-tilde
  * Windows
    * Minimize window: Alt-m
    * Show desktop: Alt-F3
    * Tiling and Snapping
      * Push tile left: Ctrl-Super-Left
      * Push tile right: Ctrl-Super-Right
      * Push tile up: Ctrl-Super-Up
      * Push tile down: Ctrl-Super-Down
  * Workspaces
    * Switch to left workspace: Ctrl-Left
    * Switch to right workspace: Ctrl-Right
    * Direct Navigation
      * Switch to workspace 1: Ctrl-1
      * Switch to workspace 2: Ctrl-2
      * etc., as needed


2. Install `sxhkd` and friends

`sxhkd` ("Simple X hotkey daemon") is a lightweight, fast, and powerful hotkey
tool with an unpronounceable name.

`scrot` is a tool for taking screenshots.

`xdotool` sends events to windows.

`xkill` is a litte different than Force Quit (Mac) or Task Manager (Windows):
it provides a graphical 'X' cursor which you then use to left-click the window
you wish to force-quit. It can be canceled with any mouse click other than left.

```
sudo apt-get install build-essential libxcb-ewmh-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xinerama0-dev scrot xcb xdotool xkill
git clone https://github.com/baskerville/sxhkd.git
cd ./sxhkd && make && sudo make install
cd ..
mkdir -p ~/.config/autostart ~/.config/sxhkd
cp config/autostart/sxhkd.desktop ~/.config/autostart/
cp config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
```

cf. [Mac keyboard shortcuts](https://support.apple.com/en-us/HT201236), [sxhkd](https://github.com/baskerville/sxhkd),


## Fish Shell

```
sudo apt-get install fish
chsh -s /usr/bin/fish
cp config/fish/config.fish ~/.config/fish/config.fish
cp -R config/fish/functions/*.fish ~/.config/fish/functions/
```

cf. [https://fishshell.com/](https://fishshell.com/)


## Cowsay, Ponysay

Terminal fun. Pick cowsay+friends, ponysay, or both.

### Cowsay

```
sudo apt-get install cowsay fortune lolcat
sudo cp cows/fish.cow /usr/share/cowsay/cows/
```

### Ponysay

```
sudo add-apt-repository ppa:vincent-c/ponysay
sudo apt-get update
sudo apt-get install ponysay
```


## Sounds

1. `sudo nano /etc/pulse/default.pa` and add the following lines at the end of the file:

    ```
    # custom screenshot sound
    load-sample screenshot /usr/share/sounds/freedesktop/stereo/screen-capture.oga

    # custom bell
    load-sample bell /usr/share/sounds/freedesktop/stereo/bell.oga
    load-module module-x11-bell sample=bell
    ```

2. Then restart pulse:

    ```
    pulseaudio -k
    ```

3. Verify the bell is audible:

    ```
    xkbbell
    ```


## rxvt

Terminal emulator. Highly customizable using `~/.Xdefaults`.
cf. https://wiki.archlinux.org/index.php/rxvt-unicode ,
https://bbs.archlinux.org/viewtopic.php?id=56605

```
sudo apt-get install rxvt-unicode-256color
cp Xdefaults ~/.Xdefaults
```

The default icon is ugly. Easy fix:

1. `sudo vim /usr/share/applications/rxvt-unicode.desktop`
2. Change `Icon=urxvt_48x48.xpm` to `Icon=gksu-root-terminal`


## irssi

IRC client.

```
sudo apt-get install irssi
cp .irssi/config ~/.irssi/
cp .irssi/*.theme ~/.irssi/
cp -r .irssi/scripts ~/.irssi/
```


## tmux

Terminal multiplexer.

```
sudo apt-get install tmux
```


## tig

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
sudo apt-get install docky
```

After Docky is installed and running, remove the task windows applet from the top panel.


## rofi

An application launcher and window manager.

```
curl -LO https://launchpad.net/ubuntu/+source/rofi/0.15.7-1/+build/7645955/+files/rofi_0.15.7-1_amd64.deb
sudo dpkg -i rofi_0.15.7-1_amd64.deb
```


## Pomodoro

An RSI timer.

1. System Settings > Applets > Available applets (online) tab
2. Find Pomodoro Timer and install


## Hamster

Time tracking.

```
sudo apt-get install hamster-applet hamster-indicatior
```


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


## Install Vim

Install `vim`, `gvim`, plugins, themes and `vimrc`:

```
sudo apt-get install vim vim-gtk
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.vim/colors/molokai.vim --create-dirs https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
cp vimrc ~/.vimrc
```


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
4. Install a [ReFind theme](http://www.rodsbooks.com/refind/themes.html#known_themes)


## Install Extra Codecs

```
sudo apt-get install ubuntu-restricted-extras
```


## Install Banshee

```
sudo apt-get install banshee
```


## Install PlayOnLinux

```
wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
sudo wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list
sudo apt-get update
sudo apt-get install playonlinux
```


## Install Steam

1. [Download the Steam .deb](http://store.steampowered.com/about/) (click "Install Steam Now").
2. Open with GDebi Package installer (dpkg)
3. Ignore the warning that an older version is available in a software channel.
4. Click "Install Package".


## Mac-style `open` in Terminal

**Not necessary when using Fish shell.**

```
echo "alias 'open'='xdg-open'" >> ~/.bashrc
```


## Yosemite Desktop Backgrounds

```
sudo cp -r /media/username/Macintosh HD/Library/Desktop\ Pictures /usr/share/backgrounds/osx-yosemite
```
