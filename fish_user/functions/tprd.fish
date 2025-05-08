function tprd
    tsh goprd

    tsh ls --format names >$HOME/.teleport_hosts
    cp -a $HOME/.teleport_hosts $HOME/.teleport_hosts_prd

    set -l host (fzf < $HOME/.teleport_hosts_prd)
    echo "Connecting to $host"
    tsh ssh $host
end
