# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTCONTROL=ignoredups
shopt -s histappend
shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Alias definitions.
[ -e $HOME/.shell_aliases ] && source $HOME/.shell_aliases
[ -e $HOME/.work_aliases ] && source $HOME/.work_aliases
[ -e $HOME/.device_aliases ] && source $HOME/.device_aliases
[ -e $HOME/.bash_env ] && source $HOME/.bash_env

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

PS1="\\[\\e[1;32m\\]\\u\\[\\e[1;37m\\]@\\[\\e[1;36m\\]\\h:\\[\\e[1;33m\\] \\w\\[\\e[1;36m\\] \\$\\[\\e[0m\\] "


#if [ ! -f $HOME/.gpg-agent-info ] && [ -x /usr/bin/gpg-agent ]; then
##if [ -x /usr/bin/gpg-agent ]; then
#  while [ ! "`ps x | grep gpg-agent | grep ssh`" == "" ] ; do
#  #while [[ ! $(ps x | grep gpg-agent | grep ssh | grep -v grep) ]] && [[ $(ps x | grep gpg-agent | grep -v grep) ]]; do
#    echo "trying to kill the agent"
#    killall gpg-agent > /dev/null 2>&1
#  done
#  eval $(gpg-agent --daemon --enable-ssh-support > $HOME/.gpg-agent-info);
#fi

# Yubikey
# export GPG_TTY=$(tty)
# gpg-connect-agent updatestartuptty /bye
# unset SSH_AGENT_PID
# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)


# fzf; fuzzy file search
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
