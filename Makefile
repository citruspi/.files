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

.PHONY: vim
