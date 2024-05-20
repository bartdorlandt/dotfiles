function VBheadless
	set -l HOST $argv[1]
	VBoxManage modifyvm "$HOST" --defaultfrontend headless
end
