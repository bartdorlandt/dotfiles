function yaml2json
    set -l FILENAME $argv[1]
    yq $FILENAME -o=json | perl -p -e 's/1$//mg'
end
