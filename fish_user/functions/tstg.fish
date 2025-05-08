function tstg
    tsh gostg

    tsh ls --format names >$HOME/.teleport_hosts
    cp -a $HOME/.teleport_hosts $HOME/.teleport_hosts_stg

    set -l host (fzf < $HOME/.teleport_hosts_stg)
    echo "Connecting to $host"
    tsh ssh $host
end
