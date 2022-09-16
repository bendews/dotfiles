#!/usr/bin/env bash

REPO_PATH=/Users/bendews/.dotfiles

set -e

function init {
	# Install Xcode Command-Line Tools
	if ! xcode-select -p; then
		xcode-select --install
		exit 0
	fi

	# Install Homebrew
	which brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/bendews/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
	brew doctor || true
	# Install dependencies required for deploying dotfiles
	brew bundle install --file="$REPO_PATH/Brewfile.deps"
}

function install {
	# Update Homebrew
	brew update

	# List dependencies to uninstall, apend --force to actually uninstall
	brew bundle cleanup # --force

	# Upgrade installed dependencies
	brew upgrade

	# Check and installs dependencies in Brewfile
	brew bundle check --file="$REPO_PATH/Brewfile" || brew bundle install --file="$REPO_PATH/Brewfile"
}

function maintenance {
	# Update brew
	brew update

	# Remove old versions of packages
	brew cleanup
	brew cask cleanup
}

case $1 in
init)
	init
	;;
install)
	install
	;;
*)
	init
	install
	maintenance
	;;
esac
