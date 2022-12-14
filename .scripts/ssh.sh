#!/usr/bin/env bash

# set -x # for debugging; prints executed commands
set -e

PRIVATE_KEY=~/.ssh/id_rsa
PUBLIC_KEY=${PRIVATE_KEY}.pub

echo ${PUBLIC_KEY}

function openGitHub {
  echo -e '\nš  Login to to your GitHub\n'
}

function generateKeys {
  echo -e '\nš  Generating new SSH key\n'
  ssh-keygen -t rsa -b 4096 -C "contact@bendews.com"
}

function addKeysToAgent {
  echo -e '\nšµļø  Starting the SSH agent\n'
  eval "$(ssh-agent -s)"

  echo -e '\nš  Adding your key to the SSH agent\n'
  # ssh-add -K ~/.ssh/id_rsa
  ssh-add -K ${PRIVATE_KEY}
}

function copyKeysToClipboard {
  echo -e '\nš  Copying your public key to the clipboard\n'
  # cat ~/.ssh/id_rsa.pub | pbcopy
  cat ${PUBLIC_KEY} | pbcopy
}

function isGitHubInstalled {
  command -v gh &> /dev/null
}

function promptUserForKeyFileTitle {
  echo -e 'šāāļø  Enter title for key file (e.g. personal computer)'
  read TITLE 
}

function addKeyFileToGitHub {
  echo -e 'š¦  Adding key file to GitHub\n'
  gh ssh-key add ${PUBLIC_KEY} --title "${TITLE}"
}

function listKeysOnGitHub {
  echo -e 'š  Listing all keys on GitHub\n'
  gh ssh-key list
}

function setRemoteUrl {
  URL="git@github.com:bendews/dotfiles.git"
  git remote set-url origin ${URL}
}

if ! isGitHubInstalled; then
  echo -e 'š¦  Installing the GitHub CLI tool\n'
  brew install gh
fi

if ! gh auth status; then
  echo -e 'š  Login to GitHub\n'
  gh auth login -s admin:public_key
fi

if [ -f ~/.ssh/id_rsa ]; then
  echo -e '\nš  Found existing SSH key\n'
else
  generateKeys && \
  addKeysToAgent && \
  copyKeysToClipboard
fi

promptUserForKeyFileTitle && \
addKeyFileToGitHub
listKeysOnGitHub
setRemoteUrl
