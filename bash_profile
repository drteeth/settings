# homebrew path
export PATH=/usr/local/bin:$PATH

# bash completion
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi

# android
export PATH=$PATH:/usr/local/Cellar/android-sdk/24.4.1_1/tools:/Applications/Android\ Studio.app/Contents/MacOS
export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/24.4.1_1/
export ANDROID_HOME=/usr/local/Cellar/android-sdk/24.4.1_1/
# export JAVA6_HOME=`/usr/libexec/java_home -v 1.6`
export ANDROID_HVPROTO=ddm

# Go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# grep options
export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude-dir=.git --exclude-dir=.bundle --exclude-dir=tmp --exclude-dir=log'

# aliases
alias ll='ls -alGh'
alias mkdir="mkdir -p"
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# prompt
export PS1='\W\[\033[32m\]$(__git_ps1) \[\033[0m\]% '

# default to 64 bit compiles
export ARCHFLAGS="-arch x86_64"

# for curl-ca-bundle and more specifically vagrant/digital ocean
# export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# set the default editor
alias vim='nvim'
export EDITOR=nvim

alias ctags="`brew --prefix`/bin/ctags"

# Make FZF respect .gitignore
export FZF_DEFAULT_COMMAND='ag -g ""'
# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*!tmp/*!log/*"'

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.profile

export PATH="$HOME/.cargo/bin:$PATH"
