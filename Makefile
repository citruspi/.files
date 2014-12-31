all: vim git tmux zsh misc ssh gem

vim:

	rm -rf ~/.vim
	rm -f ~/.vimrc

	mkdir ~/.vim
	mkdir ~/.vim/bundle
	mkdir ~/.vim/syntax

	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

	cp vim/.vimrc ~/.vimrc

	cp vim/filetype.vim ~/.vim/filetype.vim

	wget -O ~/.vim/syntax/nginx.vim 'http://www.vim.org/scripts/download_script.php?src_id=19394'

	vim +PluginInstall +qall

git:

	rm -f ~/.gitconfig
	rm -f ~/.gitignore

	cp git/.gitconfig ~/.gitconfig
	cp git/.gitignore ~/.gitignore

tmux:

	rm -f ~/.tmux.conf

	cp tmux/.tmux.conf ~/.tmux.conf

zsh:

	rm -f ~/.zshrc
	
	cp zsh/.zshrc ~/.zshrc
	source ~/.zshrc

misc:

	rm -f ~/.buzzer.mp3

	cp misc/buzzer.mp3 ~/.buzzer.mp3

ssh:

	mkdir -p ~/.ssh

	rm -rf ~/.ssh/config

	cp ssh/config ~/.ssh/config

gem:

	rm -f ~/.gemrc

	cp gem/.gemrc ~/.gemrc

.PHONY: vim git tmux zsh misc ssh gem
