if status is-interactive
    # Commands to run in interactive sessions can go here

    # fish_add_own_paths # Only needed once, they are added globally.
    set -gx IPCOLOR (ip_color)
    starship init fish | source

    if test -e $HOME/.device_aliases.fish
        source $HOME/.device_aliases.fish
    end
end
