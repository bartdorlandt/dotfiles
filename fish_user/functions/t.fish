function t
	set -f user $argv[1]
    if not set -q user[1]
        set -f user ""
    else
    	set -f user "$argv[1]@"
    end

	set -l host (fzf < $HOME/.teleport_hosts)
	echo "Connecting to $user$host"
	tsh ssh $user$host
end
