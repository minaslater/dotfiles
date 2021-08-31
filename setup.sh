#!/bin/sh

fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$0"
}

clear

cd ~/.dotfiles

fancy_echo "System Password:"
sudo -v

# checks for command line tools
xcode-select -p
if [ $? == 0 ]; then
  fancy_echo "Command Line Tools: Found."
else
  fancy_echo "Command Line Tools: Not Found. Installing..."
  xcode-select --install
fi

# Homebrew
if [ ! -f /opt/homebrew/bin/brew ]; then
  fancy_echo "Homebrew: Not Found. Installing..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  fancy_echo "Homebrew: Found. Updating..."
  brew update
fi

# cask list
OSX_APPS_LIST=(
  "google-chrome"
  "slack"
  "alfred"
  "iterm2"
  "postico"
  "rectangle"
  "1password"
  "lastpass"
  "spotify"
  "graphiql"
  "docker"
  "vs-code"
  "zoom"
)

for app in ${OSX_APPS_LIST[@]}; do
  if brew list --cask | grep $app; then
    fancy_echo "$app: Found."
  else
    fancy_echo "$app: Not Found. Installing..."
    brew  install --cask $app
  fi
done

# add rcm source - rc file manager
brew tap thoughtbot/formulae

# brew app list
BREW_APPS_LIST=(
  "coreutils"
  "moreutils"
  "elixir"
  "git"
  "mongodb"
  "gpg2"
  "neovim"
  "imagemagick"
  "openssl"
  "python@2"
  "python3"
  "yarn"
  "the_silver_searcher"
  "rcm"
  "z"
  "nvm"
  "fzf"
  "node"
  "heroku"
  "httpie"
  "redis"
  "awscli"
)

for app in ${BREW_APPS_LIST[@]}; do
  if brew list | grep $app; then
    fancy_echo "$app: Found."
  else
    fancy_echo "$app: Not Found. Installing..."
    brew install $app
  fi
done

# run rcm
if brew list | grep "rcm" > /dev/null; then
  rcup -v -v -v -v -d ~/.dotfiles
fi

# oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
  fancy_echo "oh-my-zsh: Not Found. Installing..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  fancy_echo "oh-my-zsh: Found."
fi

## Install Ruby +
if [ ! -d $HOME/.rvm ]; then
  fancy_echo "RVM not found, installing"
  \curl -sSL https://get.rvm.io | bash -s stable
else
  fancy_echo "RVM found, continuing"
fi

rvm -v 1> /dev/null
if [ $? != 0 ]; then
  fancy_echo "After this script, start a new shell session to initialize rvm and run the following command"
  fancy_echo "rvm install 3.0.0 && gem install bundler rubocop reek solargraph rails"
else
  fancy_echo "Installing ruby 3.0.0"
  rvm reload
  rvm install 3.0.0
fi

# Ruby Gems
GEMS_LIST=(
  "bundler"
  "rubocop"
  "jekyll"
  "sass"
  "rails"
  "neovim"
  "guard"
  "reek"
  "yard"
)

for gem in ${GEMS_LIST[@]}; do
  if gem list | grep $gem > /dev/null; then
    fancy_echo "$gem: Found."
  else
    fancy_echo "$gem: Not Found. Installing..."
    gem install $gem
  fi
done

# npm list
NPM_LIST=(
  "prettier"
  "create-react-app"
)

for package in ${NPM_LIST[@]}; do
  if npm list -g --depth=0 | grep $package > /dev/null; then
    fancy_echo "$package: Found."
  else
    fancy_echo "$package: Not Found. Installing..."
    npm install -g $package
  fi
done

# nvim python systems
pip2 install neovim
pip3 install neovim

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Opens vim to install plugins
nvim -u "NONE" -c ":silent source ~/.config/nvim/init.vim" -c ":silent PluginInstall" -c ":silent UpdateRemotePlugins" +qa!

# OSX system settings
osascript -e 'tell application "System Preferences" to quit'

echo "Prevent Photos from opening automatically when devices are plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

echo "Finder: show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Avoid creating .DS_Store files on network or USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo "Keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

echo "Dock shows only active apps"
defaults write com.apple.dock static-only -bool true; killall Dock

echo "Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Add some login items
echo "Add Rectangle as login item"
osascript -e 'tell application "System Events" to make login item at end with properties {name: "Rectangle",path:"/Applications/Rectangle.app", hidden:false}'

echo "Add Alfred as login item"
osascript -e 'tell application "System Events" to make login item at end with properties {name: "Alfred 3",path:"/Applications/Alfred 3.app", hidden:false}'

echo "restart affected applications"
for app in "Calendar" "Contacts" "Dock" "Finder" "SystemUIServer"; do
  killall "$app" &> /dev/null
done
# }}}

# ssh keys
echo "Generating ssh key"
ssh-keygen -t rsa -b 4096 -C "slater.mina@gmail.com"
eval "$(ssh-agent -s)"
echo "Adding ssh key to ssh-agent"
ssh-add -K ~/.ssh/id_rsa
