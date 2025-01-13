function llt
    if type -q eza
        lla -s created $argv
    else
        lla -tr --color $argv
    end
end
