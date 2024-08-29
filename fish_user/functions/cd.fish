function cd
	if type -q z
		z $argv
	else
		cd $argv
	end
end
