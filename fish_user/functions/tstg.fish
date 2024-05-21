function tstg
	tsh gostg && tsh ssh (fzf < $HOME/.teleport_hosts_stg)
end
