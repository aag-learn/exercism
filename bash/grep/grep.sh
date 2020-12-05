#!/usr/bin/env bash
FILES=""
LFLAG=false
NFLAG=false

function match() {
    local pattern=$1
    local file=$2
    local linenum=1

    while IFS= read -r line; do
        if [[ $line =~ $pattern ]]; then  
            if [ $LFLAG == 'true' ]; then
                echo $file
            else
                if [ $NFLAG == 'true' ]; then
                    printf '%s:%s\n' "$linenum" "$line"
                else
                    printf '%s\n' "$line"            
                fi
            fi
        fi
        linenum=$(( $linenum + 1 ))
    done < "$file"
} 


function process_arguments() {
    
    while getopts "ln" flag; do
        case ${flag} in
            l )
                LFLAG=true
                ;;
            n )
                NFLAG=true
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
