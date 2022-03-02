alias ll='ls -alGh --color'
alias mkdir="mkdir -p"
alias grep='grep --color=auto --exclude=*.pyc --exclude-dir=.git --exclude-dir=.bundle --exclude-dir=tmp --exclude-dir=log'
alias vim=nvim
alias pndev-shell='pndev shell'

export FZF_DEFAULT_COMMAND='rg --files' # --follow'
export FZF_DEFAULT_OPTS='-m'

# Use docker as the local user to avoid permission problems
alias docker-compose="env UID=$(id -u ${whoami}) GID=$(id -g ${whoami}) docker-compose"
alias docker="env UID=$(id -u ${whoami}) GID=$(id -g ${whoami}) docker"

# prompt
export PS1='\W\[\033[32m\]$(__git_ps1) \[\033[0m\]% '

export EDITOR=nvim

# neovim
export PATH="$HOME/neovim/bin:$PATH"

# node
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
# export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
# export RLS_ROOT="$HOME/.cargo/bin/rls"

# Spacemacs
export PATH=~"$HOME/.local/bin:$PATH"

# Exercism.io
export PATH="$PATH:$HOME/bin"

# Elixir LSP
export PATH="$PATH:$HOME/projects/elixir-ls/rel"

# Python / Gigalixir client
export PATH="$PATH:$HOME/.local/bin"

export PATH="$HOME/.cargo/bin:$PATH"

# Fly.io
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# RVM
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

# Nix
if [ -e /home/ben/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ben/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# ASDF
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# eval "$(direnv hook bash)"
