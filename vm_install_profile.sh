#!/bin/bash

if [[ -n "$1" ]] ; then
	PROFILEDIR=$1
else
	PROFILEDIR=$HOME/git/dotfiles
fi

test -d $PROFILEDIR || (echo "Provide the location behind this script." && exit 1)

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
# VIM bundle
if [[ ! -d $HOME/.vim/bundle ]] ; then
	git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

### Other environment ###
echo "Creating symlinks for screenrc, email forward"
ln -sf $PROFILEDIR/screenrc $HOME/.screenrc

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
	# Aptitude
	if [[ ! -d $HOME/.aptitude ]]; then
			mkdir $HOME/.aptitude
	fi
	FILE="$PROFILEDIR/$SUB/aptitude-config"
	test -f $FILE && ln -sf $FILE $HOME/.aptitude/config
fi
