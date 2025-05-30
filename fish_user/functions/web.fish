function web
    set -l current_dir (pwd)
    set -l SPECIFIED_PATH $argv[1]
    set -l GITPATH (gitupfind)

    if test -z "$GITPATH"
        echo "No .git directory found"
        return 1
    end

    set -g URL (_gitconfigurl)

    if test -n "$SPECIFIED_PATH"
        # calculate path
        set -l FULLPATH (echo $current_dir | sed -r "s@$GITPATH@@")/$SPECIFIED_PATH
        set -l BRANCH (git branch --show-current)

        if string match -e github (_gitconfigurl)
            set -g URLPATH "/blob/$BRANCH/$FULLPATH"
        else if string match -e gitlab (_gitconfigurl)
            set -g URLPATH "/-/blob/$BRANCH/$FULLPATH?ref_type=heads"
        else
            echo "Git repository not implemented."
            return
        end

        # set -l URLPATH "/-/blob/$BRANCH/$FULLPATH?ref_type=heads"
        set -g URL $URL$URLPATH
    end

    open -u $URL
end
