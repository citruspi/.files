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

# ------------------------------
# Aliases
# ------------------------------

alias ..='cd ../'
alias 'back=cd $OLDPWD'

if [[ $platform == 'linux' ]]; then
    alias ls='ls -GFh --color'
elif [[ $platform == 'osx' ]]; then
    alias ls='ls -GFh'
fi

# ------------------------------
# Key Bindings
# ------------------------------

bindkey "^K"      kill-whole-line
bindkey "^A"      beginning-of-line
bindkey "^E"      end-of-line

# ------------------------------
# Colors
# ------------------------------

autoload colors; colors

for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
eval PR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
  eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

eval RESET='$reset_color'
export PR_RED PR_GREEN PR_YELLOW PR_BLUE PR_WHITE PR_BLACK
export PR_BOLD_RED PR_BOLD_GREEN PR_BOLD_YELLOW PR_BOLD_BLUE
export PR_BOLD_WHITE PR_BOLD_BLACK

unset LSCOLORS

if [[ $platform == 'osx' ]]; then
    export CLICOLOR=1
    export LSCOLORS=exfxcxdxbxegedabagacad
elif [[ $platform == 'linux' ]]; then
    #LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
    #export LS_COLORS
    eval $(dircolors -b /etc/DIR_COLORS.256color)
fi

# ------------------------------
# Exports
# ------------------------------

export EDITOR=vim

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

export ARCHFLAGS='-arch x86_64'

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

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
