#!/usr/bin/env bash

main() {
	local operation=$1
	local number=$2

	if [[ -z "${2+x}" ]]; then
		echo "Number is unset"
		exit 1
	fi

	case $operation in
	square_of_sum)
		square_of_sum "$number"
		;;
	sum_of_squares)
		sum_of_squares "$number"
		;;
	difference)
		difference "$number"
		;;
	*)
		echo "Invalid operation: $operation"
		exit 1
		;;
	esac
}

square_of_sum() {
	local number=$1
	echo "$((((number + 1) * number / 2) ** 2))"
}

sum_of_squares() {
	local number=$1
	echo "$((number * (number + 1) * (2 * number + 1) / 6))"
}

difference() {
	local number=$1
	echo "($(square_of_sum "$number") - $(sum_of_squares "$number"))" | bc
}

main "$@"
