#!/usr/bin/env bash
FILES=""
LFLAG=false
NFLAG=false
IFLAG=false
VFLAG=false
XFLAG=false

declare -a LFLAG_FILES

function match() {
    local pattern=$1
    local file=$2
    local linenum=1

    [ "$XFLAG" == "true" ] && pattern="^${pattern}$"

    while IFS= read -r line; do
        #if [[ ( "$IFLAG" -eq "false" && $line =~ $pattern ) || ( "$IFLAG" -eq "true" && ${line,,} =~ ${pattern,,} ) ]]; then  
        if [[ ( "$IFLAG" == "false" && "$VFLAG" == "false" && $line =~ $pattern ) || ( "$IFLAG" == "true" && "$VFLAG" == "false" && ${line,,} =~ ${pattern,,} ) || ( "$IFLAG" == "false" && "$VFLAG" == "true" && ( ! ${line} =~ ${pattern} ) ) || ( "$IFLAG" == "true" && "$VFLAG" == "true" && ( ! ${line,,} =~ ${pattern,,} ) ) ]]; then  
            if [ "$LFLAG" == "true" ]; then
                add_matched_file_to_output_file_list $file
            else
                if [ ${#FILES[@]} -gt 1 ]; then
                    if [ $NFLAG == 'true' ]; then
                        printf '%s:%s:%s\n' "$file" "$linenum" "$line"
                    else
                        printf '%s:%s\n' "$file" "$line"
                    fi
                    
                elif [ $NFLAG == 'true' ]; then
                    printf '%s:%s\n' "$linenum" "$line"
                else
                    printf '%s\n' "$line"            
                fi
            fi
        fi
        linenum=$(( $linenum + 1 ))
    done < "$file"
} 

function add_matched_file_to_output_file_list {
    local file=$1
    local IN_LFLAG_FILES=false
    for element in "${LFLAG_FILES[@]}"; do
        [[ "$element" == "$file" ]] && IN_LFLAG_FILES=true
    done
    [[ "$IN_LFLAG_FILES" == "false" ]] && LFLAG_FILES+=("$file")

}

function process_arguments() {
    
    while getopts "ilnvx" flag; do
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
            v )
                VFLAG=true
                ;;
            x )
                XFLAG=true
                ;;
        esac
    done
    shift $((OPTIND -1))

    PATTERN=$1
    shift
    FILES=("$@")

}

function find_pattern_in_files {

    for file in ${FILES[@]}; do
        match "$PATTERN" "$file"
    done

}

function display_files_if_lflag_is_set {
    if [ ${#LFLAG_FILES[@]} -gt 0 ]; then
        for element in ${LFLAG_FILES[@]}; do
            echo $element
        done
    fi
}

main () {

    process_arguments "$@"

    find_pattern_in_files

    display_files_if_lflag_is_set
}

# call main with all of the positional arguments
main "$@"
