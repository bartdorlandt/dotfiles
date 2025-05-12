function teleport_ssh
    tsh ls --format names >$HOME/.teleport_hosts
    set -l host (fzf < $HOME/.teleport_hosts)

    if set -q argv[1]
        echo "Connecting to $host -- $argv"
        tsh ssh $host -- $argv
    else
        echo "Connecting to $host"
        tsh ssh $host
    end

end
