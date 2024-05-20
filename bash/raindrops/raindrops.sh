#!/usr/bin/env bash

OUTPUT=""
IS_FACTOR_OF_THREE_SOUND="Pling"
IS_FACTOR_OF_FIVE_SOUND="Plang"
IS_FACTOR_OF_SEVEN_SOUND="Plong"

function usage {
	echo "Usage: $0 <number>"
}
function valid_arguments {
	if [[ $# -ne 1 ]]; then
		return 1
	else
		return 0
	fi
}

function pling {
	local number="$1"
	[ $(( number % 3 )) -eq 0 ] &&  OUTPUT="${OUTPUT}${IS_FACTOR_OF_THREE_SOUND}"

}

function plang {
	local number="$1"
	[ $(( number % 5 )) -eq 0 ] && OUTPUT="${OUTPUT}${IS_FACTOR_OF_FIVE_SOUND}"

}

function plong {
	local number="$1"
	[ $(( number % 7 )) -eq 0 ] &&  OUTPUT="${OUTPUT}${IS_FACTOR_OF_SEVEN_SOUND}"

}

function make_sound {
	pling "$@"
	plang "$@"
	plong "$@"
}

function print_output {
	if [ "$OUTPUT" == "" ]; then
		echo "$1"
	else
		echo "$OUTPUT"
	fi	
}

main () {
	if ( valid_arguments "$@"); then
		make_sound "$@"
		print_output "$@"
	else
		usage
		exit 1
	fi
}

main "$@"
