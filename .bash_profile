# bash completion
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi

# rvm
source $HOME/.rvm/scripts/rvm

# rbenv
# eval "$(rbenv init -)"

# homebrew path
export PATH=$HOME/.rvm/bin:/usr/local/bin:/usr/local/sbin:$PATH

# bundler binstubs
# export PATH=.bundle/binstubs:$PATH

# android path
export PATH=$PATH:/Applications/Android\ Studio.app/sdk/tools:/Applications/Android\ Studio.app/sdk/platform-tools
export ANDROID_SDK_ROOT=/Applications/Android\ Studio.app/sdk
export ANDROID_HOME=/Applications/Android\ Studio.app/sdk/

# Go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
# export GOROOT=/usr/local/go # no longer needed?

# node.js
export PATH=$PATH:/usr/local/share/npm/bin

# StandardML
# export PATH=$PATH:/usr/local/Cellar/smlnj/110.75/libexec/bin

# Haskell
# export PATH=$PATH:$HOME/.cabal/bin

# https://packer.io
export PATH=$PATH:/usr/local/packer

# grep options
export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude-dir=.git --exclude-dir=.bundle --exclude-dir=tmp --exclude-dir=log'

# aliases
alias ll='ls -alGh'

# prompt
export PS1='\W\[\033[32m\]$(__git_ps1) \[\033[0m\]% '

# default to 64 bit compiles
export ARCHFLAGS="-arch x86_64"

# for curl-ca-bundle and more specifically vagrant/digital ocean
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# set the default editor to subl
export EDITOR=subl
