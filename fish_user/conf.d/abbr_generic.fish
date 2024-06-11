abbr --add dotdot --regex '^\.\.+$' --function multicd

abbr --add - cd -

abbr -a fish_reload_config 'source ~/.config/fish/**/*.fish'

abbr --add awscli 'python3 -m awscli'

abbr --add FISH cd $__fish_config_dir

abbr --add p ping
abbr --add pst ps axjf
abbr --add psc ps xawf -eo pid,user,cgroup,args
abbr --add sudr sudo -i
abbr --add sud sudo su
abbr --add n nslookup
abbr --add dus du -hc | sort -h
abbr --add o less

abbr --add curlo curl -# -C - -O -J -L
abbr --add CON screen /dev/ttyUSB0 9600
# abbr --add sshlog $HOME/scripts/ssh-logging.sh
abbr --add sno ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no
# abbr --add alg alias | grep  # in fish this needs to be a function!
abbr --add dns nmcli device show | grep -e DNS -e GENERAL.DEVICE
abbr --add run ./run

abbr --add venv source ./.venv/bin/activate.fish

abbr --add upd brew upgrade