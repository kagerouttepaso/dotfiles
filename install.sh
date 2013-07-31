rm -rf ~/.gitconfig
rm -rf ~/.vimrc
rm -rf ~/.zshrc
rm -rf ~/.vim

PWD_DIR=`pwd`
ln -s ${PWD_DIR}/_gitconfig ~/.gitconfig
ln -s ${PWD_DIR}/_vimrc     ~/.vimrc
ln -s ${PWD_DIR}/_zshrc     ~/.zshrc
ln -s ${PWD_DIR}/_vim       ~/.vim

cd 
if [ ! -d .vim/bundle/neobundle.vim ] ; then
git clone https://github.com/Shougo/neobundle.vim.git ./.vim/bundle/neobundle.vim
fi
