if [[ -e /etc/profile.d/apps-bin-path.sh ]] ; then
    source /etc/profile.d/apps-bin-path.sh
fi

if [[ -e /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
