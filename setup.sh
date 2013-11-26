rm -rf ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

mkdir ~/.vim/colors
wget -O ~/.vim/colors/Tomorrow-Night-Eighties.vim https://raw.github.com/chriskempson/vim-tomorrow-theme/master/colors/Tomorrow-Night-Eighties.vim

rm -f ~/.zshrc
rm -f ~/.vimrc
rm -f ~/.bashrc
rm -f ~/.gitconfig
rm -f ~/.zlogin
rm -f ~/.tmux.conf

ln -s ~/.files/.zshrc ~/.zshrc
ln -s ~/.files/.vimrc ~/.vimrc
ln -s ~/.files/.bashrc ~/.bashrc
ln -s ~/.files/.gitconfig ~/.gitconfig
ln -s ~/.files/.zlogin ~/.zlogin
ln -s ~/.files/.tmux.conf ~/.tmux.conf

vim +BundleInstall

source ~/.zshrc

(cd ~/.files && git remote set-url origin git@github.com:citruspi/.files.git)
