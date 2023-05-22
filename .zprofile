if [[ -e /etc/profile.d/apps-bin-path.sh ]] ; then
    source /etc/profile.d/apps-bin-path.sh
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
