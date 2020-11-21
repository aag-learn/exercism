#!/usr/bin/env bash
FILES=""

function match() {
    local pattern=$1
    local file=$2

    while IFS= read -r line; do
       [[ $line =~ $pattern ]] && printf '%s\n' "$line"
    done < "$file"
} 

main () {
    local pattern=$1
    FILES=($2)

    for file in ${FILES[@]}; do
        match $pattern $file
    done
}

# call main with all of the positional arguments
main "$@"
