#!/usr/bin/env bash


function proverb_closing_phrase {
	echo "And all for the want of a $1."
}
function proverb_phrase {
	echo "For want of a $1 the $2 was lost."
}	

function proverb {
	local items=("$@")
	[ ${#items[@]} -gt 1 ] && for i in "${!items[@]}"; do
	        [ $i -eq $(( "${#items[@]}" - 1 )) ] && continue
		proverb_phrase "${items[$i]}" "${items[ $(( $i + 1 )) ]}"	
	done
	[ ${#items[@]} -gt 0 ] && proverb_closing_phrase "${items[0]}"
}

main () {
	proverb "$@"
	exit 0	
}

main "$@"
