## .files

My personal dotfiles for

- Vim
- Tmux
- Git
- Z Shell
- SSH

## Usage

Don't run the following commands on your computer without going through the dotfiles and the setup script. __Your files are not backed up - they are deleted.__

### Installation

#### Proper

    cd /tmp
    wget https://raw.githubusercontent.com/citruspi/.files/master/setup.sh
    vim setup.sh
    bash setup.sh
    cd $OLDPWD

#### One Liner

    cd /tmp; wget https://raw.githubusercontent.com/citruspi/.files/master/setup.sh; bash setup.sh; cd $OLDPWD;

### Update

    refresh
