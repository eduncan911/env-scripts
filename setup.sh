# requirements are to have Dropbox installed at:
#   ~/Dropbox/
# as well as have this git repo to reside at:
#   ~/scripts/
#
# then you can run this shell script that will setup
# the following applications:
#
#   * ~/config/SublimeText3/ shared Packages/User/ config files.
#   * ~/git-prompt for bash cli colorizing
#   * ~/.bashrc xterm scripts
#   * ~/.i3/ configurations
#   * cmd to disable screensaver

# add some fonts
#sudo apt-get install  ttf-mscorefonts-installer
# instead, install the Windows 8.1 fonts!!!
# http://www.webupd8.org/2013/07/how-to-download-and-install-windows-81.html
# convert the Helvetica one using: http://onlinefontconverter.com/font?id=p1

# gnome apps
sudo apt-get install gnome-tweak-tool gnome-system-log gucharmap gnome-packagekit \
gnome-chess gnome-clocks gnome-control-center gnome-control-center-data \
gnome-control-center-dev gnome-desktop-data dia evolution evolution-ews file-roller \
gnome-session gnome-settings-daemon gnome-panel evince gnomine gnome-font-viewer \
gnome-hearts gnome-music gnome-nettool gnome-sushi gnome-system-tools ntp \
gnome-media-profiles Polari scrot gcolor2

# gnome-tweak tool settings
Fonts : Hinting - Slight
        Antialiasing - Grayscale

# gcolor3
sudo apt-get install intltool libgtk-3-dev
git clone https://github.com/Unia/gcolor3

# Adwaita Dark for Qt4 / GTK 2.0 apps
sudo apt-get install qt4-qtconfig
# ^- use this app to configure the default theme to use GTK+
#
# next, download this theme and extra out the gtk-2.0 directory:
# http://cbowman57.deviantart.com/art/Adwaita-Dark-Gnome-Shell-3-14-481516328
# sudo cp -rf gtk-2.0 /usr/share/themes/Adwaita
# should take effect on next app restart

# utilities
sudo apt-get install iotop nmon baobab

# setup some aliases
pushd ~/bin
ln -s /usr/bin/gucharmap gnome-charactermap
ln -s /usr/bin/nautilus gnome-files
ln -s /usr/bin/gpk-application gnome-application
popd

# http://feeding.cloud.geek.nz/posts/creating-a-modern-tiling-desktop-environment-using-i3/

# fix cursor with gnome-settings-daemon
# http://www.blog.kaiserapps.com/2013/10/how-to-fix-mouse-cursor-disappearing-in.html
gsettings set org.gnome.settings-daemon.plugins.cursor active false

# change browser default
update-alternatives --config x-www-browser
update-alternatives --config www-browser 

# setup j3-dmenu
git clone git@github.com:enkore/j4-dmenu-desktop.git
sudo apt-get install cmake
cd j4-dmenu-desktop
cmake .
make
sudo make install

# controlling the monitors
# source: http://pkg-xorg.alioth.debian.org/howto/use-xrandr.html
xrandr --output VBOX1 --off
xrandr --output VBOX1 --above VBOX0
# also: --left-of --right-of --below
