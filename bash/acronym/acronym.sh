#!/usr/bin/env bash

main() {
	local words=($(echo "$@" | sed -E "s/[^a-zA-Z0-9']+/ /g"))
	local result=""
	for word in "${words[@]}"; do
		local letter=$(echo "${word:0:1}" | tr 'a-z' 'A-Z')
		result=${result}${letter}
	done
	echo $result
}

main "$@"
