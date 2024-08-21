function l
	if type -q eza
		eza -F $argv
	else
		ls -CF --color $argv
	end
end
