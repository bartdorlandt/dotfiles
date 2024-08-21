function vi
	if test -x /usr/bin/vim
		vim $argv
	else
		vi $argv
	end
end
