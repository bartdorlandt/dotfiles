function ip_color
    ip --color > /dev/null 2>&1
    if test $status -eq 0
        echo "--color"
    end
end
