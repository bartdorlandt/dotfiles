function venvcreate
    set -f VERSION $argv[1]
    if not set -q VERSION[1]
        set -f VERSION ""
    end

	set -l COMMAND (string join "" "python" $VERSION)
	_CMD $COMMAND -m venv .venv $argv[2..]
	_CMD source ./.venv/bin/activate.fish
	_CMD python -m pip install -U pip
end
