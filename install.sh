ln -snf `pwd`/ackrc ~/.ackrc
ln -snf `pwd`/agignore ~/.agignore
ln -snf `pwd`/agignore ~/.ignore
ln -snf `pwd`/bash_profile ~/.bash_profile
ln -snf `pwd`/bashrc-linux ~/.bashrc
ln -snf `pwd`/ctags ~/.ctags
ln -snf `pwd`/gemrc ~/.gemrc
ln -snf `pwd`/gitconfig ~/.gitconfig
ln -snf `pwd`/gitignore_global ~/.gitignore_global
ln -snf `pwd`/psqlrc ~/.psqlrc
ln -snf `pwd`/rspec ~/.rspec
ln -snf `pwd`/spacemacs ~/.spacemacs
ln -snf `pwd`/tmux.conf ~/.tmux.conf
ln -snf `pwd`/vim ~/.vim
ln -snf `pwd`/git_template ~/.git_template
ln -snf `pwd`/vimrc ~/.vimrc
ln -snf `pwd`/editorconfig .editorconfig

# neovim
ln -snf ~/.vim ~/.config/nvim
ln -snf ~/.vimrc ~/.config/nvim/init.vim

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install vim plugs
vim +PlugInstall +PlugClean! +qa
