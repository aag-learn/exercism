#!/usr/bin/env bash
FILES=""
LFLAG=false

function match() {
    local pattern=$1
    local file=$2

    while IFS= read -r line; do
        if [[ $line =~ $pattern ]]; then  
            if [ $LFLAG == 'true' ]; then
                echo $file
            else
                printf '%s\n' "$line"
            fi
        fi
    done < "$file"
} 


function process_arguments() {
    
    while getopts "l" flag; do
        case ${flag} in
            l )
                LFLAG=true
                ;;    
        esac
    done
    shift $((OPTIND -1))

    PATTERN=$1
    FILES=($2)

}
main () {

    process_arguments "$@"
     
    for file in ${FILES[@]}; do
        match $PATTERN $file
    done
}

# call main with all of the positional arguments
main "$@"
