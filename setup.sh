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

ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.zlogin ~/.zlogin
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

vim +BundleInstall

source ~/.zshrc
tmux source-file ~/.tmux.conf

(cd ~/dotfiles && git remote set-url origin git@github.com:citruspi/dotfiles.git)
