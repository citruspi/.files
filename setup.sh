rm -rf ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

rm -f ~/.vimrc
rm -f ~/.bashrc
rm -f ~/.gitconfig
rm -f ~/.zlogin
rm -f ~/.tmux.conf

ln -s ~/.files/.vimrc ~/.vimrc
ln -s ~/.files/.bashrc ~/.bashrc
ln -s ~/.files/.gitconfig ~/.gitconfig
ln -s ~/.files/.zlogin ~/.zlogin
ln -s ~/.files/.tmux.conf ~/.tmux.conf
