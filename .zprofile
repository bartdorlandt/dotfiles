if [[ -e /etc/profile.d/apps-bin-path.sh ]] ; then
    source /etc/profile.d/apps-bin-path.sh
fi

# pyenv
if [[ -e /usr/local/bin/pyenv || -e $HOME/.pyenv/bin/pyenv || -e /opt/homebrew/bin/pyenv ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"  # with shell integration
    # eval "$(pyenv init --path)" # without shell integration
fi
