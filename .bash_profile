# .bash_profile is used for login shells (login, username/password)
[ -e $HOME/.bashrc ] && source $HOME/.bashrc

[ -d $HOME/bin ] && export PATH="$HOME/bin:$PATH"
[ -d $HOME/scripts ] && export PATH="$HOME/scripts:$PATH"
[ -d $HOME/.poetry/bin ] && export PATH="$HOME/.poetry/bin:$PATH"
