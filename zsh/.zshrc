# Checks

platform='unknown'
unamestr=$(uname)

if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='osx'
fi


. $HOME/.zsh/go
. $HOME/.zsh/postgresql
. $HOME/.zsh/python
. $HOME/.zsh/ruby
. $HOME/.zsh/chef

. $HOME/.zsh/aliases
. $HOME/.zsh/key-bindings
. $HOME/.zsh/colours
. $HOME/.zsh/exports

# ------------------------------
# Functions 
# ------------------------------

refresh() {
    cd /tmp;
    wget https://raw.githubusercontent.com/citruspi/.files/master/setup.sh;
    make;
    cd $OLDPWD;
}

unpack() {
    if [[ -f $1 ]]; then
        case $1 in
            *.tar.bz2) tar xvjf $1;;
            *.tar.gz) tar xvzf $1;;
            *.tar.xz) tar xvJf $1;;
            *.tar.lzma) tar --lzma xvf $1;;
            *.bz2) bunzip $1;;
            *.rar) unrar $1;;
            *.gz) gunzip $1;;
            *.tar) tar xvf $1;;
            *.tbz2) tar xvjf $1;;
            *.tgz) tar xvzf $1;;
            *.zip) unzip $1;;
            *.Z) uncompress $1;;
            *.7z) 7z x $1;;
            *.dmg) hdiutul mount $1;; # mount OS X disk images
            *) echo "'$1' cannot be extracted via >ex<";;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

path() {
    echo $PATH | tr ":" "\n" | \
        awk "{ sub(\"/usr\", \"$fg_no_bold[green]/usr$reset_color\"); \
               sub(\"/bin\", \"$fg_no_bold[blue]/bin$reset_color\"); \
               sub(\"/opt\", \"$fg_no_bold[cyan]/opt$reset_color\"); \
               sub(\"/sbin\", \"$fg_no_bold[magenta]/sbin$reset_color\"); \
               sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
               sub(\"/.rvm\", \"$fg_no_bold[red]/.rvm$reset_color\"); \
               print }"
}

# ------------------------------
# Prompt
# ------------------------------

PROMPT="$ "
