function gitupfind
    # Start from the current directory
    set current_dir (pwd)
    # Loop until we reach the root directory "/"
    while test "$current_dir" != "/"
        # Check if the .git directory exists in the current directory
        if test -f "$current_dir/.git/config"
            # If found, print the absolute path and exit
            echo "$current_dir"
            return
        end
        # Move up one directory
        set current_dir (dirname "$current_dir")
    end
    # If we reached here, .git directory was not found
    echo ""
end
