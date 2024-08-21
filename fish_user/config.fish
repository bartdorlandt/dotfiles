if status is-interactive
    # Commands to run in interactive sessions can go here

    # fish_add_own_paths # Only needed once, they are added globally.
    set -gx IPCOLOR (ip_color)
    starship init fish | source
    zoxide init fish | source
    ### Fix for vscode using fish with virtualenv autoload
    string match -q "$TERM_PROGRAM" "vscode"
        and . (code --locate-shell-integration-path fish)

    if test -e $HOME/.device_aliases.fish
        source $HOME/.device_aliases.fish
    end
end
