#!/bin/bash

# Installs Homebrew and some of the common dependencies needed/desired for software development

# Ask for the administrator password upfront
sudo -v

# make TextEdit open with a blank file by default, to restore, run defaults delete -g NSShowAppCentricOpenPanelInsteadOfUntitledFile
defaults write -g NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false

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
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup

brew tap homebrew/cask-fonts

apps=(
    google-chrome
    amazon-chime
    amazon-workspaces
    font-jetbrains-mono
    intellij-idea
    visual-studio-code
)

brew cask install "${apps[@]}"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# spaceship theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

