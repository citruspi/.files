#!/usr/local/bin/zsh
#
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
. $HOME/.zsh/functions/init
. $HOME/.zsh/prompt
