## .files

My personal dotfiles for

- Vim
- Tmux
- Git
- Z Shell
- SSH

## Usage

Don't run the following commands on your computer without going through the dotfiles and the setup script. __Your files are not backed up - they are deleted.__

### Install

    cd ~ && git clone git://github.com/citruspi/dotfiles.git ~/dotfiles && ~/dotfiles/setup.sh

### Update

	cd ~/dotfiles && git pull origin master && ./setup.sh