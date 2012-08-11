# bash completion
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

# rvm
# source $HOME/.rvm/scripts/rvm

# rbenv
eval "$(rbenv init -)"

# homebrew path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# bundler binstubs
export PATH=./bin:$PATH

# android path
export PATH=$PATH:/usr/local/Cellar/android-sdk/current/tools:/usr/local/Cellar/android-sdk/current/platform-tools
export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/current

# aliases
alias ll='ls -alGh'

# prompt
export PS1='\w\[\033[32m\]$(__git_ps1) \[\033[0m\]% '

# default to 64 bit compiles
export ARCHFLAGS="-arch x86_64"
