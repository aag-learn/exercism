#!/usr/bin/env bash

function usage {
	echo "Usage: leap.sh <year>"
}

function argument_is_valid {
	if [[ ( "$#" -eq 1 ) && ( "$1" =~ ^[0-9]+$ )]] ; then
		echo "true"
	else
		echo "false"
	fi
}

function is_leap_year {
	local year=$1
	if (($1 % 4 == 0)) && (($1 % 100 != 0 || $1 % 400 == 0)); then 
		echo "true";
	else	
		echo "false";
	fi
}
main () {
	# We use test instead of [[ ]] to combine different conditional expressions in the same script
	if test $(argument_is_valid "$@") == "true" ; then
		is_leap_year $1
	else
		usage
		exit 1
	fi
}

main "$@"
