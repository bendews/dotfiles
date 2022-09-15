#!/bin/bash

function stash {
    op account get >/dev/null || eval $(op signin)
    if test -e "$HOME/.kube/config"; then op document edit "Kube Config" "$HOME/.kube/config"; fi
    if test -e "$HOME/.azure/credentials"; then op document edit "Azure Credentials" "$HOME/.azure/credentials"; fi
    if test -e "$HOME/.local/share/fish/fish_history"; then op document edit "Fish Shell History" "$HOME/.local/share/fish/fish_history"; fi
}

function unstash {
    op account get >/dev/null || eval $(op signin)
    if test -e "$HOME/.kube/config"; then rm -rf "$HOME/.kube/config"; fi
    if test -e "$HOME/.azure/credentials"; then rm -rf "$HOME/.azure/credentials"; fi
    if test -e "$HOME/.local/share/fish/fish_history"; then rm -rf "$HOME/.local/share/fish/fish_history"; fi
    op document get "Kube Config" --output="$HOME/.kube/config"
    op document get "Azure Credentials" --output="$HOME/.azure/credentials"
    op document get "Fish Shell History" --output="$HOME/.local/share/fish/fish_history"
}

case $1 in
stash)
    stash
    ;;
unstash)
    unstash
    ;;
*)
    echo "stash or unstash"
    ;;
esac
