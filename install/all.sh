#!/bin/bash

# Installs Homebrew and some of the common dependencies needed/desired for software development

# Ask for the administrator password upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade --all

apps=(
    pyenv
    git
    chromedriver
    jenv
    sbt
    
    
    # bash-completion2
    # coreutils
    # moreutils
    # findutils
    # grep --with-default-names
    # imagemagick --with-webp
    # ffmpeg
    # python
    # source-highlight
    # wget
    # thefuck
    # jq
    # gradle
    # go
    # dep
    # etcd
    # maven
    # gradle
    # shellcheck
    # postgresql
    # gcc
    # kubectl
    # node
    # yarn
    # pkg-config
    # cmake
    # qt
    # docker
    # hunspell
    # poppler --with-qt --enable-xpdf-headers
    # glances
    # libgit2
    # qpdf
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup

# Install Caskroom
# brew tap caskroom/cask
# brew tap caskroom/versions
brew tap homebrew/cask-fonts

apps=(
    google-chrome
    amazon-chime
    amazon-workspaces
    font-jetbrains-mono
    intellij-idea
    visual-studio-code
    # atom
    # sublime-text
    # pycharm-ce
    # docker
    # docker-machine
    # virtualbox
    # minikube
    # iterm2
)

brew cask install "${apps[@]}"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# spaceship theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"


# # JVM
# brew cask install java
# brew install scala

# # Install R and RStudio
# brew cask install xquartz
# brew tap homebrew/science
# brew install --with-x11 r
# brew cask install --appdir=/Applications rstudio

# # Go
# ## GVM
# bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# # Tex
# brew cask install basictex
# git clone https://github.com/TeXworks/texworks.git
# cd texworks; mkdir build; cd build; cmake ..; make; make install; cd ../..

# # Misc
# gem install jekyll jekyll-paginate
# npm install -g typescript

# # Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package
