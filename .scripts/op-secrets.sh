#!/bin/bash

function stash {
    op account get > /dev/null || eval $(op signin)
    op document edit "Kube Config" "$HOME/.kube/config"
    op document edit "Azure Credentials" "$HOME/.azure/credentials"
    op document edit "Fish Shell History" "$HOME/.local/share/fish/fish_history"
}

function unstash {
    op account get > /dev/null || eval $(op signin)
    rm -rf "$HOME/.kube/config"
    rm -rf "$HOME/.azure/credentials"
    rm -rf "$HOME/.local/share/fish/fish_history"
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
