platform='unknown'
unamestr=$(uname)

if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='osx'
fi

#Virtualenv Wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

if [[ $platform == 'linux' ]]; then
    source /usr/bin/virtualenvwrapper.sh
elif [[ $platform == 'osx' ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi
