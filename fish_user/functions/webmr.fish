function webmr
    set -l current_dir (pwd)
    set -l GITPATH (gitupfind)

    if test -z "$GITPATH"
        echo "No .git directory found"
        return 1
    end

	set -g URL (_gitconfigurl)
	set -l BRANCH (git branch --show-current)

	if string match -q $BRANCH "master" "main"
		echo "Main/Master branch, skipping"
		return
	end

	if string match -e github (_gitconfigurl)
		set -g URLPATH "/compare/$BRANCH?expand=1"
	else if string match -e gitlab (_gitconfigurl)
		set -g URLPATH "/-/merge_requests/new?merge_request%5Bsource_branch%5D=$BRANCH"
	else
		echo "Git repository not implemented."
		return
	end

	set -g URL $URL$URLPATH

    echo "Opening: https://$URL"
	open -u https://$URL
end
