#!/usr/bin/env bash


function proverb_closing_phrase {
	echo "And all for the want of a $1."
}
function proverb_phrase {
	echo "For want of a $1 the $2 was lost."
}	

function proverb {
	local items=("$@")
	for (( i=0; i < $(( $# - 1 )); i++ )); do
		proverb_phrase "${items[$i]}" "${items[ $(( $i + 1 )) ]}"	
	done
	[ $# -gt 0 ] && proverb_closing_phrase "${items[0]}"
}

main () {
	proverb "$@"
	exit 0
}

main "$@"
