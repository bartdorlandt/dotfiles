function tprd --wraps=teleport_ssh
    tsh goprd
    teleport_ssh $argv
end
