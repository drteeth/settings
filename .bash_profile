# bash completion
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

# rvm
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*

# rbenv
eval "$(rbenv init -)"

# homebrew path
export PATH=/usr/local/bin:$PATH

# android path
export PATH=$PATH:/usr/local/Cellar/android-sdk/current/tools:/usr/local/Cellar/android-sdk/current/platform-tools

# aliases
alias ll='ls -alGh'

# prompt
export PS1='\w\[\033[32m\]$(__git_ps1) \[\033[0m\]% '

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# default to 64 bit compiles
export ARCHFLAGS="-arch x86_64"
