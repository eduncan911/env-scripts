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

# http://feeding.cloud.geek.nz/posts/creating-a-modern-tiling-desktop-environment-using-i3/

# fix cursor with gnome-settings-daemon
# http://www.blog.kaiserapps.com/2013/10/how-to-fix-mouse-cursor-disappearing-in.html
# gsettings set org.gnome.settings-daemon.plugins.cursor active false

# change browser default
# update-alternatives --config x-www-browser
# update-alternatives --config www-browser 

# setup j3-dmenu
# git clone git@github.com:enkore/j4-dmenu-desktop.git
# sudo apt-get install cmake
# cd j4-dmenu-desktop
# cmake .
# make
# sudo make install


