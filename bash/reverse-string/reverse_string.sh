#!/usr/bin/env bash 

function reverse_string {
	# This is a two line version (easier to understand) of the code below:
	#
	# local reversed_string=$(echo "$@" | rev )
	# echo "$reversed_string"
	echo "$@" | rev
}

main () {
	reverse_string "$@"
}
main "$@"
