if test -e /usr/local/bin/pyenv || test -e $HOME/.pyenv/bin/pyenv || test -e /opt/homebrew/bin/pyenv
    # this is done once. (Universal variables)
    set -Ux PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin
    pyenv init - | source
end