# bash completeion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

initnvm(){
    # nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

remove_init_aliases(){
    unset -f npm
    unset -f yarn
}

init_node_script(){
    which=$(which npm)

    if [ -z "$which" ]
    then
        remove_init_aliases
        initnvm
    fi
}

yarn(){
    init_node_script
    yarn $@
}

npm(){
    init_node_script
    npm $@
}

tsc(){
    init_node_script
    tsc $@
}

initpy(){
    # pyenv
    export PATH="~/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    # virtual env
    export WORKON_HOME=~/.venvs
    export VIRTUALENVWRAPPER_PYTHON=$(pyenv which python3.7)
    export VIRTUALENVWRAPPER_VIRTUALENV=$(dirname $(pyenv which python3.7))/virtualenv
    source $(dirname $(pyenv which python3.7))/virtualenvwrapper.sh
}

initpyenv(){
    name=$1
    if [ -z "$name" ]
    then
        name=$(basename "$PWD")
    fi
    say $name
    mkvirtualenv -p python3 $name
    workon .
    pip install -e .
}
