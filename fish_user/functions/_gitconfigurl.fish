function _gitconfigurl
    set -l GITPATH (gitupfind)

    if test -z "$GITPATH"
        echo ""
        return
    end

    set -g URL (cat "$GITPATH/.git/config" | grep -A1 '\[remote "origin"\]' | grep "url =" | cut -d '@' -f2 | tr : / | sed -r "s/\.git//")
    echo $URL
end
