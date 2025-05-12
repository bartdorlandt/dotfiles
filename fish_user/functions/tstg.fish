function tstg --wraps=teleport_ssh
    tsh gostg
    teleport_ssh $argv
end
