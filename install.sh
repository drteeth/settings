ln -snf `pwd`/ackrc ~/.ackrc
ln -snf `pwd`/agignore ~/.agignore
ln -snf `pwd`/bash_profile ~/.bash_profile
ln -snf `pwd`/ctags ~/.ctags
ln -snf `pwd`/gemrc ~/.gemrc
ln -snf `pwd`/gitconfig ~/.gitconfig
ln -snf `pwd`/gitignore_global ~/.gitignore_global
ln -snf `pwd`/psqlrc.conf ~/.psqlrc.conf
ln -snf `pwd`/rspec.conf ~/.rspec.conf
ln -snf `pwd`/spacemacs ~/.spacemacs
ln -snf `pwd`/tmux.conf ~/.tmux.conf
ln -snf `pwd`/vimrc ~/.vimrc

# neovim
mkdir -p ~/.config/nvim
ln -snf `pwd`/nvim-init.vim ~/.config/nvim/init.vim

# vim-plug for neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ctags
# brew tap universal-ctags/universal-ctags
# brew install --HEAD universal-ctags

# vim-plug for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install vim plugs
vim +PlugInstall +PlugClean! +qa

