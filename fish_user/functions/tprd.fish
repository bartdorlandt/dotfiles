function tprd
	tsh goprd && tsh ssh (fzf < $HOME/.teleport_hosts_prd)

end
