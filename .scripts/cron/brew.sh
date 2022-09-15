#!/usr/bin/env bash

# Update brew
brew update

# Upgrade all brew packages
brew upgrade

# Remove old versions of packages
brew cleanup
brew cask cleanup

