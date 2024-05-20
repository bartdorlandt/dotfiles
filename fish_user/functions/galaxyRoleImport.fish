function galaxyRoleImport
	# Need to have the current directory name. Just the name, not the path
	set -f last_component (basename $PWD)
	ansible-galaxy role import --token (cat ~/.ansible/galaxy_token) bartdorlandt $last_component
end
