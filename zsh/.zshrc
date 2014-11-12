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
    export GOPATH=$HOME/.go

    if [ -f "/usr/local/bin/go-virtualenv.sh" ]; then
        source /usr/local/bin/go-virtualenv.sh

        alias genv='go-mkvirtualenv'
        alias gon='go-workon'
        alias goff='go-deactivate'
    fi
elif [[ $platform == 'linux' ]]; then
    export GOROOT=/usr/lib/golang
    export GOPATH=$HOME/.go
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
    source /usr/bin/virtualenvwrapper.sh
elif [[ $platform == 'osx' ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
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
    bash setup.sh
    cd $OLDPWD;
}

ex() {
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

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

autoload -U colors && colors

GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"
GIT_PROMPT_PREFIX="%{$fg[green]%} [%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}u%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}d%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}s%{$reset_color%}"

function parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

function parse_git_state() {

    # Compose this value via multiple conditional appends.
    local GIT_STATE=""

    local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_AHEAD" -gt 0 ]; then
        GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
    fi

    local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_BEHIND" -gt 0 ]; then
        GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
    fi

    local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
    if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
    fi

    if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
    fi

    if ! git diff --quiet 2> /dev/null; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
    fi

    if ! git diff --cached --quiet 2> /dev/null; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
    fi

    if [[ -n $GIT_STATE ]]; then
        echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
    fi

}

function git_prompt_string() {
    local git_where="$(parse_git_branch)"
    [ -n "$git_where" ] && echo "on %{$fg[blue]%}${git_where#(refs/heads/|tags/)}%{$reset_color%}$(parse_git_state)"
}

function current_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

#PROMPT='
#${PR_GREEN}%n%{$reset_color%} %{$FG[239]%}at%{$reset_color%} ${PR_BOLD_BLUE}$(box_name)%{$reset_color%} %{$FG[239]%}in%{$reset_color%} ${PR_BOLD_YELLOW}$(current_pwd)%{$reset_color%} $(git_prompt_string)
#$(prompt_char) '

#PROMPT='%n@%m:' + $(pwd)

#export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "

#RPROMPT=`$(virtualenv_info)`
PROMPT="[%n@%m:%/] > "
RPROMPT=`[ $VIRTUAL_ENV ] && echo '('\`basename $VIRTUAL_ENV\`')'`
