ln -snf `pwd`/.ackrc ~/.ackrc
ln -snf `pwd`/.agignore ~/.agignore
ln -snf `pwd`/.gemrc ~/.gemrc
ln -snf `pwd`/.gitconfig ~/.gitconfig
ln -snf `pwd`/.gitignore_global ~/.gitignore_global
ln -snf `pwd`/.tmux.conf ~/.tmux.conf
ln -snf `pwd`/.vimrc ~/.vimrc
ln -snf `pwd`/.spacemacs ~/.spacemacs
ln -snf `pwd`/.bash_profile ~/.bash_profile

# neovim
mkdir -p ~/.config/nvim
ln -snf `pwd`/nvim-init.vim ~/.config/nvim/init.vim

# vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ctags
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
