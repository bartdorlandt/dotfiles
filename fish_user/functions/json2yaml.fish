function json2yaml
	set -l FILENAME $argv[1]
    cat $FILENAME | jq -S | yq -P "."
end
