#!/bin/bash

REPO_PATH=/Users/bendews/.dotfiles
DOCUMENT_TITLE="Dotfiles Secret Files"
DOCUMENT_PATH=$REPO_PATH/secrets.tar.gz
SECRETS_PATH=$REPO_PATH/secrets

function stash {
    op account get >/dev/null || eval $(op signin)
    tar -czf $DOCUMENT_PATH -C $SECRETS_PATH .
    op item get "$DOCUMENT_TITLE" && op document edit "$DOCUMENT_TITLE" $DOCUMENT_PATH || op document create $DOCUMENT_PATH --title="$DOCUMENT_TITLE"
    rm -rf $DOCUMENT_PATH
}

function unstash {
    op account get || eval $(op signin)
    rm -rf $DOCUMENT_PATH
    mkdir -p $SECRETS_PATH
    op document get "$DOCUMENT_TITLE" --output=$DOCUMENT_PATH
    tar -xzf $DOCUMENT_PATH -C $SECRETS_PATH
    rm -rf $DOCUMENT_PATH
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
