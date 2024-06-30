#!/usr/bin/env bash

main() {
	# using_sed "$@"
	using_bash "$@"
}

# Solution using parameter expansion
using_bash() {
	local acronym=""
	local sentence="${1//[^a-zA-Z0-9\']/ }"
	for word in $sentence; do
		acronym="$acronym${word:0:1}"
	done
	echo "${acronym^^}"
}

using_sed() {
	local words
	words=$(echo "$@" | sed -E "s/[^a-zA-Z0-9']+/ /g")
	local result=""
	for word in $words; do
		local letter
		letter=$(echo "${word:0:1}" | tr '[:lower:]' '[:upper:]')
		result=${result}${letter}
	done
	echo "$result"
}

main "$@"
