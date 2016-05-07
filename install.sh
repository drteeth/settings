ln -snf `pwd`/.ackrc ~/.ackrc
ln -snf `pwd`/.agignore ~/.agignore
ln -snf `pwd`/.gemrc ~/.gemrc
ln -snf `pwd`/.gitconfig ~/.gitconfig
ln -snf `pwd`/.gitignore_global ~/.gitignore_global
ln -snf `pwd`/.tmux.conf ~/.tmux.conf
ln -snf `pwd`/.vimrc ~/.vimrc
ln -snf `pwd`/.spacemacs ~/.spacemacs

# neovim
mkdir -p ~/.config/nvim
ln -snf `pwd`/nvim-init.vim ~/.config/nvim

# vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
