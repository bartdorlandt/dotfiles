function _gitconfigurl
    set -l GITPATH (gitupfind)

    if test -z "$GITPATH"
        echo ""
        return
    end
    set -l URLSTR (cat "$GITPATH/.git/config" | grep -A1 '\[remote "origin"\]' | grep "url =")
    if string match -q -e 'https://' $URLSTR
        set -g URL (echo $URLSTR | cut -d '=' -f2 | tr -d '[:space:]')
    else
        set -g URL https://(echo $URLSTR | cut -d '@' -f2 | tr : / | sed -r "s/\.git//")
    end
    echo $URL
end
