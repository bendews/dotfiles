set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin:$PATH
eval (env SHELL=fish /opt/homebrew/bin/brew shellenv)
source /opt/homebrew/opt/asdf/libexec/asdf.fish
