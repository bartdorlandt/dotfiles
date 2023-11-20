if [[ -e /etc/profile.d/apps-bin-path.sh ]] ; then
    source /etc/profile.d/apps-bin-path.sh
fi

# brew
if [[ -e /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if [[ $(command -v brew) ]]; then
    test -e "$(brew --prefix)/var/run/yubikey-agent.sock" && export SSH_AUTH_SOCK="$(brew --prefix)/var/run/yubikey-agent.sock"
    test -d "$(brew --prefix openssh)/bin" && export PATH=$(brew --prefix openssh)/bin:$PATH
fi

# pyenv
if [[ -e /usr/local/bin/pyenv || -e $HOME/.pyenv/bin/pyenv || -e /opt/homebrew/bin/pyenv ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"  # with shell integration
    # eval "$(pyenv init --path)" # without shell integration
fi

