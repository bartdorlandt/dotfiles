function webmr
    set -l current_dir (pwd)
    set -l GITPATH (gitupfind)

    if test -z "$GITPATH"
        echo "No .git directory found"
        return 1
    end

    set -g URL (cat "$GITPATH/.git/config" | grep "url =" | cut -d '@' -f2 | tr : / | sed -r "s/\.git//")
	set -l BRANCH (git branch --show-current)

	if string match -q $BRANCH "master" "main"
		echo "Main/Master branch, skipping"
		return
	end

	set -l URLPATH "/-/merge_requests/new?merge_request%5Bsource_branch%5D=$BRANCH"
	set -g URL $URL$URLPATH

    echo "Opening: https://$URL"
	open -u https://$URL
end
