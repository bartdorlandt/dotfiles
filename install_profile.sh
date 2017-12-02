#!/bin/bash

if [[ -n "$1" ]] ; then
	PROFILEDIR=$1
else
	PROFILEDIR=$HOME/git/dotfiles
fi

test -d $PROFILEDIR || (echo "Provide the location behind this script." && exit 1)

# Making sure ~/git exists
test -d $HOME/git/ || mkdir $HOME/git

SUB=user
if [[ $(id -u) == 0 ]]; then
	SUB=root
fi

### Bash environment ###
echo "Creating symlinks for BASH (alias, profile, bashrc)"
if [[ -e $HOME/.shell_aliases ]]; then
	rm $HOME/.shell_aliases
fi
ln -sf $PROFILEDIR/shell_aliases $HOME/.shell_aliases 
if [[ -e $HOME/.bash_profile ]]; then
	rm $HOME/.bash_profile
fi
ln -sf $PROFILEDIR/$SUB/bash_profile $HOME/.bash_profile 
if [[ -e $HOME/.bashrc ]]; then
	rm $HOME/.bashrc
fi
ln -sf $PROFILEDIR/$SUB/bashrc $HOME/.bashrc 

### VIM environment ###
echo "Creating the VIM environment"
test -L $HOME/.vim && rm $HOME/.vim
test -d $HOME/.vim || mkdir $HOME/.vim
if [[ ! -d $HOME/.vim/ftdetect ]]; then rm $HOME/.vim/ftdetect; mkdir $HOME/.vim/ftdetect; fi
if [[ ! -d $HOME/.vim/syntax ]]; then rm $HOME/.vim/syntax; mkdir $HOME/.vim/syntax; fi
ln -sf $PROFILEDIR/vimrc $HOME/.vimrc
ln -sf $PROFILEDIR/vimrc.bundles $HOME/.vimrc.bundles
# VIM bundle
if [[ ! -d $HOME/.vim/bundle ]] ; then
	git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

### Tmux ###
echo "Creating the TMUX environment"
ln -sf $PROFILEDIR/tmux.conf $HOME/.tmux.conf
ln -sf $PROFILEDIR/tmuxp $HOME/.tmuxp		# will need pip3 --user install tmuxp

if [[ ! -d $HOME/.tmux/plugins/tpm ]] ; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

### Other environment ###
echo "Creating symlinks for screenrc, email forward"
ln -sf $PROFILEDIR/screenrc $HOME/.screenrc

if [[ ! -e $HOME/.forward ]] ; then 
	echo "Do you want to create a .forward file. If so type your email, else enter"
	read EMAIL
	if [[ -n "$EMAIL" ]] ; then 
		if [[ -L $HOME/.forward ]]; then 
			rm $HOME/.forward
		fi
		echo $EMAIL > $HOME/.forward 
	fi
fi

echo "Creating zsh environment"
if [[ ! -d $HOME/git/oh-my-zsh-custom ]] ; then
	git clone git@github.com:bambam82/oh-my-zsh-custom.git $HOME/git/oh-my-zsh-custom
fi
if [[ ! -d $HOME/git/zsh-autosuggestions ]] ; then
	git clone git://github.com/zsh-users/zsh-autosuggestions.git $HOME/git/zsh-autosuggestions
fi
if [[ ! -d $HOME/git/zsh-syntax-highlighting ]] ; then
	git clone git@github.com:zsh-users/zsh-syntax-highlighting.git $HOME/git/zsh-syntax-highlighting
fi
ln -sf $HOME/git/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting 
ln -sf $HOME/git/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

if [[ -e $HOME/.zshrc ]]; then
	rm $HOME/.zshrc
fi
ln -sf $PROFILEDIR/zshrc $HOME/.zshrc 
if [[ -d $HOME/.oh-my-zsh ]] && [[ ! -L $HOME/.oh-my-zsh/custom ]] ; then
	DIR="$HOME/git/oh-my-zsh-custom"
	for x in $(ls -1 $DIR); do
		# Variable path due to VM's
		#ln -sf ../../git/oh-my-zsh-custom/$x $HOME/.oh-my-zsh/custom/
		ln -sf $DIR/$x $HOME/.oh-my-zsh/custom/
	done
fi

echo "Git settings"
git config --global user.name "`whoami`@`hostname`"
test -n "$EMAIL" && git config --global user.email $EMAIL
git config --global core.editor vim
git config --global push.default simple
git config --global core.excludesfile .gitignore
git config --global branch.autosetuprebase always
git config --global core.whitespace warn
git config --global core.autocrlf input
git config --global core.filemode true

############################################################################
### User specific
############################################################################
if [[ ! $(id -u) == 0 ]]; then
	echo "User specifics"
	### Python environment
	if [[ ! -e $HOME/.pypirc ]] ; then 
		echo -e "\nIn case you wish to create the ~/.pypirc config file for pypi, provide a username and then a password. If the username is empty, nothing is generated."
		echo "Username:"
		read USERNAME
		if [[ -n "$USERNAME" ]] ; then
			echo "Password:"
			read -s -r PASSWORD
		fi
		if [[ -n "$USERNAME" ]] && [[ -n "$PASSWORD" ]] ; then
			cat > $HOME/.pypirc << EOF
[distutils]
index-servers=pypi

[pypi]
repository = https://pypi.python.org/pypi
username = $USERNAME
password = $PASSWORD
EOF
		chmod 600 $HOME/.pypirc
		fi
	fi
fi

############################################################################
### root specific
############################################################################
if [[ $(id -u) == 0 ]]; then
	echo "Root specifics"
	if [[ -e $HOME/.root_aliases ]]; then
		rm $HOME/.root_aliases
	fi
	ln -sf $PROFILEDIR/$SUB/root_aliases $HOME/.root_aliases 
	#
	FILE="$PROFILEDIR/etc/udev/rules.d/99-yubikeys.rules"
	test -f $FILE && ln -sf $FILE /etc/udev/rules.d/99-yubikeys.rules
	FILE="$PROFILEDIR/etc/udev/rules.d/51-android.rules"
	test -f $FILE && ln -sf $FILE /etc/udev/rules.d/51-android.rules
	#
	echo "	Creating symlink for sudoers"
	if [[ -d /etc/sudoers.d ]]; then
		ln -f $PROFILEDIR/etc/sudoers.d/global_sudo /etc/sudoers.d/globalsudo
		if [[ -e /etc/sudoers.d/globalsudo ]]; then
			chmod 440 /etc/sudoers.d/globalsudo
		fi
	else
		echo "  /etc/sudoers.d/ doesn't exists. Not applying globalsudo file."
	fi
	#
	# Aptitude
	if [[ ! -d $HOME/.aptitude ]]; then
			mkdir $HOME/.aptitude
	fi
	FILE="$PROFILEDIR/$SUB/aptitude-config"
	test -f $FILE && ln -sf $FILE $HOME/.aptitude/config
fi

# Add an git pull to crontab if it doesn't exist yet
# if [[ -z $(crontab -l | grep "oh-my-zsh" | grep "git pull") ]] ; then 
#	 line="@reboot cd $HOME/.oh-my-zsh ; git pull > /dev/null 2>&1"
#	 line2="0 6 1 * * cd $HOME/.oh-my-zsh ; git pull > /dev/null 2>&1"
#	 (crontab -l; echo "$line" ; echo "$line2") | crontab -
# fi

echo ""
echo "you might want to add the following line to your crontab."
echo "	only if no password is required"
echo "0 5 * * *	git pull $PROFILEDIR > /dev/null 2>&1"
