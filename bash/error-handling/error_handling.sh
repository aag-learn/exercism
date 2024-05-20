#!/usr/bin/env bash
function usage {
	echo "Usage: error_handling.sh <person>"
}

function valid_arguments {
	if [[ $# -ne 1 ]]; then
		return 1
	else
		return 0
	fi
}

function say_hello {
	echo  "Hello, ${1}"
}

main () {
	if ( valid_arguments "$@" ); then
		say_hello "$@"
	else
		usage
		exit 1
	fi	
}

main "$@"
