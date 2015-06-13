all: update vim lftp git tmux zsh ssh gem

update:

	@if git rev-parse --git-dir > /dev/null 2>&1; then git pull origin master; fi

vim:

	@rm -rf ~/.vim
	@rm -f ~/.vimrc

	@mkdir ~/.vim
	@mkdir ~/.vim/bundle
	@mkdir ~/.vim/syntax

	@git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

	@cp vim/.vimrc ~/.vimrc

	@cp vim/filetype.vim ~/.vim/filetype.vim

	@curl -o ~/.vim/syntax/nginx.vim 'http://www.vim.org/scripts/download_script.php?src_id=19394'

	@vim +PluginInstall +qall

lftp:

	@rm -f ~/.lftpc

	@cp lftp/.lftprc ~/.lftprc

git:

	@rm -f ~/.gitconfig
	@rm -f ~/.gitignore

	@cp git/.gitconfig ~/.gitconfig
	@cp git/.gitignore ~/.gitignore

tmux:

	@rm -f ~/.tmux.conf

	@cp tmux/.tmux.conf ~/.tmux.conf

zsh:

	@rm ~/.zshrc
	@rm -rf ~/.zsh

	@cp -r zsh ~/.zsh
	@ln -s ~/.zsh/init ~/.zshrc
	@source ~/.zshrc

ssh:

	@mkdir -p ~/.ssh

	@rm -rf ~/.ssh/config
	@rm -rf ~/.ssh/authorized_keys

	@cp ssh/config ~/.ssh/config
	@touch ~/.ssh/authorized_keys

	@for key in ssh/authorized_keys/*; do cat $$key >> ~/.ssh/authorized_keys; done

gem:

	@rm -f ~/.gemrc

	@cp gem/.gemrc ~/.gemrc

.PHONY: update vim lftp git tmux zsh ssh gem
