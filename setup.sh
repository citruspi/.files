cd ~
git clone https://github.com/citruspi/.files.git /tmp/dotfiles
rm -rf ~/.files
mv /tmp/dotfiles/.files ~/.files
rm -rf /tmp/dotfiles

rm -rf ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

mkdir ~/.vim/colors
wget -O ~/.vim/colors/Tomorrow-Night-Eighties.vim https://raw.github.com/chriskempson/vim-tomorrow-theme/master/colors/Tomorrow-Night-Eighties.vim

rm -f ~/.zshrc
rm -f ~/.vimrc
rm -f ~/.bashrc
rm -f ~/.gitconfig
rm -f ~/.gitignore
rm -f ~/.zlogin
rm -f ~/.tmux.conf

ln -s ~/.files/.zshrc ~/.zshrc
ln -s ~/.files/.vimrc ~/.vimrc
ln -s ~/.files/.bashrc ~/.bashrc
ln -s ~/.files/.gitconfig ~/.gitconfig
ln -s ~/.files/.gitignore ~/.gitignore
ln -s ~/.files/.zlogin ~/.zlogin
ln -s ~/.files/.tmux.conf ~/.tmux.conf

vim +BundleInstall

mkdir ~/.vim/syntax

ln -s ~/.files/filetype.vim ~/.vim/filetype.vim

wget -O ~/.vim/syntax/nginx.vim 'http://www.vim.org/scripts/download_script.php?src_id=19394'

source ~/.zshrc
tmux source-file ~/.tmux.conf
