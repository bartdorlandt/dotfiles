function proj
    set -f project $argv[1]
    set -f VERSION $argv[2]
    if not set -q VERSION[1]
        set -f VERSION 3
    end
    mkdir -p $project
	echo "Created path: $project"
    cd $project
    venvcreate $VERSION
end
