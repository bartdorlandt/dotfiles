function git_main_branch
    command git rev-parse --git-dir &> /dev/null || return
    set -l ref
    for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk}
        if command git show-ref -q --verify $ref
			# echo ${ref:t}
            echo (basename $ref)
            return
		end
	end
    echo master
end
