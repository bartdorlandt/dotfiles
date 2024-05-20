if test -e /usr/local/bin/pyenv || test -e $HOME/.pyenv/bin/pyenv || test -e /opt/homebrew/bin/pyenv
    # this is done once. (Universal variables)
    pyenv init - | source
end
