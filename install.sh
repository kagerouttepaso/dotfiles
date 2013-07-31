rm -rf ../.gitconfig
rm -rf ../.vimrc
rm -rf ../.zshrc
rm -rf ../.vim

ln    .gitconfig ../.gitconfig
ln    .vimrc     ../.vimrc
ln    .zshrc     ../.zshrc
ln -s .vim       ../.vim
