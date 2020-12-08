#!/usr/bin/env bash
FILES=""
LFLAG=false
NFLAG=false
IFLAG=false
XFLAG=false

function match() {
    local pattern=$1
    local file=$2
    local linenum=1

    [ "$XFLAG" == "true" ] && pattern="^${pattern}$"

    while IFS= read -r line; do
        #if [[ ( "$IFLAG" -eq "false" && $line =~ $pattern ) || ( "$IFLAG" -eq "true" && ${line,,} =~ ${pattern,,} ) ]]; then  
        if [[ ( "$IFLAG" == "false" && $line =~ $pattern ) || ( "$IFLAG" == "true" && ${line,,} =~ ${pattern,,} ) ]]; then  
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
    
    while getopts "ilnx" flag; do
        case ${flag} in
            i )
                IFLAG=true
                ;;
            l )
                LFLAG=true
                ;;
            n )
                NFLAG=true
                ;;
            x )
                XFLAG=true
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
        match "$PATTERN" "$file"
    done
}

# call main with all of the positional arguments
main "$@"
