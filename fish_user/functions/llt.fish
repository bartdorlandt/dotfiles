function llt
	if type -q eza
		lla -rt=modified $argv
	else
		lla -tr --color $argv
	end
end
