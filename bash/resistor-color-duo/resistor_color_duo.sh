#!/usr/bin/env bash

function convert_colors_to_numbers() {
    local colors=("$@")
    local output=""
    local number=""
    for color in ${colors[@]:0:2}; do
        number_or_error_message=$(color_to_number $color)
        if [ "$?" != "0" ]; then
            echo "invalid color"
            exit 1
        else
            output+=$number_or_error_message
        fi

    done

    echo "$output"
}

function color_to_number() {
    local color= $1
    case ${1,,} in 
        black )
            echo "0"
            return 0
            ;;
        brown ) 
            echo "1"
            return 0
            ;;
        red)
            echo "2"
            return 0
            ;;
        orange ) 
            echo "3"
            return 0
            ;;
        yellow )
            echo "4"
            return 0
            ;;
        green )
            echo "5"
            return 0
            ;;
        blue )
            echo "6"
            return 0
            ;;
        violet )
            echo "7"
            return 0
            ;;
        grey )
            echo "8"
            return 0
            ;;
        white )
            echo "9"
            return 0
            ;;
        * )
            echo ""
            return 1
    esac
}

function main {
    convert_colors_to_numbers "$@"
}

main "$@"