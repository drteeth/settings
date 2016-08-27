# homebrew path
export PATH=/usr/local/bin:$PATH

bash completion
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi

# android
export PATH=$PATH:/Applications/Android\ Studio.app/sdk/tools:/Applications/Android\ Studio.app/sdk/platform-tools
export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/24.4.1_1/
export ANDROID_HOME=/usr/local/Cellar/android-sdk/24.4.1_1/
# export JAVA6_HOME=`/usr/libexec/java_home -v 1.6`
export ANDROID_HVPROTO=ddm

# Go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# node.js
# export PATH=$PATH:/usr/local/share/npm/bin
# export PATH="~/.node/bin:$PATH"

# StandardML
# export PATH=$PATH:/usr/local/Cellar/smlnj/110.75/libexec/bin

# Haskell
# export PATH=$PATH:$HOME/.cabal/bin

# https://packer.io
# export PATH=$PATH:/usr/local/packer

# grep options
export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude-dir=.git --exclude-dir=.bundle --exclude-dir=tmp --exclude-dir=log'

# aliases
alias ll='ls -alGh'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# prompt
export PS1='\W\[\033[32m\]$(__git_ps1) \[\033[0m\]% '

# default to 64 bit compiles
export ARCHFLAGS="-arch x86_64"

# for curl-ca-bundle and more specifically vagrant/digital ocean
# export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# set the default editor
export EDITOR=vim
alias vim='nvim'

# Make FZF respect .gitignore
export FZF_DEFAULT_COMMAND='ag -g ""'

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.profile
