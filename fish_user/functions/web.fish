function web
    set current_dir (pwd)
    set SPECIFIED_PATH $argv[1]
    set GITPATH (gitupfind)
    
    if test -z "$GITPATH"
        echo "No .git directory found"
        return 1
    end

    set URL (cat "$GITPATH/.git/config" | grep "url =" | cut -d '@' -f2 | tr : / | sed -r "s/\.git//")
    
    if test -z "$SPECIFIED_PATH"
        set URL $URL
    else
        # calculate path
        set FULLPATH (echo $current_dir | sed -r "s@$GITPATH@@")/$SPECIFIED_PATH
        set BRANCH (git branch --show-current)
        set URLPATH /-/blob/$BRANCH/$FULLPATH?ref_type=heads
        set URL $URL$URLPATH
        # echo $URL
    end
    
    open -u https://$URL
end
