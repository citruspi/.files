# Checks

platform='unknown'
unamestr=$(uname)

if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='osx'
fi

# ------------------------------
# Go Stuff
# ------------------------------

if [[ $platform == 'osx' ]]; then
    export GOROOT=$(brew --prefix)/Cellar/go/$(brew list go | head -n 1 | cut -d '/' -f 6)/libexec
    export GOPATH=$HOME/Code/.go
elif [[ $platform == 'linux' ]]; then
    export GOROOT=/usr/lib/golang
    export GOPATH=$HOME/.go
fi

# ------------------------------
# Ruby Stuff
# ------------------------------

if [[ $platform == 'osx' ]]; then
    if [[ -d "$HOME/.gem/" ]]; then
        export PATH=$PATH:$HOME/.gem/ruby/$(ls $HOME/.gem/ruby/ | tail -n 1)/bin
    fi
fi

# ------------------------------
# Aliases
# ------------------------------

alias buzzer='afplay ~/.buzzer.mp3'
alias ..='cd ../'
alias 'back=cd $OLDPWD'

if [[ $platform == 'linux' ]]; then
    alias ls='ls -GFh --color'
elif [[ $platform == 'osx' ]]; then
    alias ls='ls -GFh'
fi

alias mkenv='mkvirtualenv'
alias on="workon"
alias off="deactivate"

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

#Virtualenv Wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

if [[ $platform == 'linux' ]]; then
     if [ -f "/usr/bin/virtualenvwrapper" ]; then
        source /usr/bin/virtualenvwrapper.sh
     fi
elif [[ $platform == 'osx' ]]; then
    if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
        source /usr/local/bin/virtualenvwrapper.sh
    fi
fi

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

function loc() {
    local total
    local firstletter
    local ext
    local lines
    total=0
    for ext in $@; do   
        firstletter=$(echo $ext | cut -c1-1)
        if [[ firstletter != "." ]]; then
            ext=".$ext"
        fi
        lines=`find-exec "*$ext" cat | wc -l`
        lines=${lines// /}
        total=$(($total + $lines))
        echo "Lines of code for ${fg[blue]}$ext${reset_color}: ${fg[green]}$lines${reset_color}"
    done
    echo "${fg[blue]}Total${reset_color} lines of code: ${fg[green]}$total${reset_color}"
}

export PATH=$PATH:$GOPATH/bin

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
