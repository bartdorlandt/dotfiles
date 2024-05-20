function fish_add_own_paths
	# go
	fish_add_path $HOME/go/bin
    fish_add_path /usr/local/go/bin

	# home bin dirs
    fish_add_path $HOME/bin

	# vscode
    fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

    # pyenv python executables
	set -Ux PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin
    fish_add_path $HOME/.local/bin
end
