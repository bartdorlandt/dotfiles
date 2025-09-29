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

if [[ -e ~/.orbstack/shell/init.zsh ]]; then
  # Added by OrbStack: command-line tools and integration
  # This won't be added again if you remove it.
  source ~/.orbstack/shell/init.zsh 2>/dev/null || :
fi