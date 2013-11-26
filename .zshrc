platform='unknown'
unamestr=$(uname)

if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='osx'
fi

#Virtualenv Wrapper
export WORKON_HOME=$HOME/.virtualenvs

if [[ $platform == 'linux' ]]; then
    source /usr/bin/virtualenvwrapper.sh
elif [[ $platform == 'osx' ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi
