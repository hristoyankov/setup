#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
git config --global user.name "Hristo Yankov"
git config --global user.email "ico.yankov@gmail.com"
git config --global core.editor emacs
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# add-apt-repository is not installed in some ubuntu distributions
# e.g. hashicorp/precise64. Let's install it!
sudo apt-get install -y software-properties-common
sudo apt-get install -y python-software-properties

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

<<<<<<< HEAD
# Install and setup rvm and Rails 4.0.0
curl -L https://get.rvm.io | bash -s stable
rvm requirements --autolibs=enable
rvm install 2.0.0
rvm use 2.0.0
rvm --default 2.0.0
gem install rails --version 4.0.0 --no-ri --no-rdoc


=======
>>>>>>> parent of bd6b5a1... Added rvm, ruby2.0.0 and rails4
# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/hristoyankov/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .

