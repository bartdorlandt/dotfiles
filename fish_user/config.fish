if status is-interactive
    # Commands to run in interactive sessions can go here

    # fish_add_own_paths # Only needed once, they are added globally.
    set -gx IPCOLOR (ip_color)
    starship init fish | source
    zoxide init --cmd cd fish | source
    ### Fix for vscode using fish with virtualenv autoload
    string match -q "$TERM_PROGRAM" vscode
    and . (code --locate-shell-integration-path fish)

    if test -e $HOME/.device_aliases.fish
        source $HOME/.device_aliases.fish
    end

    if type -q atuin
        atuin init fish | source
    end
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
fish_ssh_agent
