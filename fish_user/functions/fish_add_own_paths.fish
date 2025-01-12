function fish_add_own_paths
    set -Ux PAGER less
    set -Ux BAT_PAGER ""
    set -Ux EDITOR vim
    set -Ux PYTHONSTARTUP $HOME/.pythonstartup
    set -Ux LESS --chop-long-lines --HILITE-UNREAD --ignore-case --incsearch --jump-target=4 --LONG-PROMPT --no-init --quit-if-one-screen --RAW-CONTROL-CHARS --use-color --window=-4

    set -U fish_greeting

    # go
    fish_add_path $HOME/go/bin
    fish_add_path /usr/local/go/bin

    # home bin dirs
    fish_add_path $HOME/bin

    # vscode
    fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

    # pyenv python executables
    # set -Ux PYENV_ROOT $HOME/.pyenv
    # fish_add_path $PYENV_ROOT/bin
    fish_add_path $HOME/.local/bin
end
