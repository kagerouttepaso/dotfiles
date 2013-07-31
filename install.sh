rm -rf ../.gitconfig
rm -rf ../.vimrc
rm -rf ../.zshrc
rm -rf ../.vim

ln    .gitconfig ../.gitconfig
ln    .vimrc     ../.vimrc
ln    .zshrc     ../.zshrc
ln -s .vim       ../.vim
if [ ! -d .vim/bundle/neobundle.vim ] ; then
git clone https://github.com/Shougo/neobundle.vim.git ./.vim/bundle/neobundle.vim
fi
