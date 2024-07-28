#!/usr/bin/env bash

# The following comments should help you get started:
# - Bash is flexible. You may use functions or write a "raw" script.
#
# - Complex code can be made easier to read by breaking it up
#   into functions, however this is sometimes overkill in bash.
#
# - You can find links about good style and other resources
#   for Bash in './README.md'. It came with this exercise.
#
#   Example:
#   # other functions here
#   # ...
#   # ...
#
#   main () {
#     # your main function code here
#   }
#
#   # call main with all of the positional arguments
#   main "$@"
#
# *** PLEASE REMOVE THESE COMMENTS BEFORE SUBMITTING YOUR SOLUTION ***

main() {
  local n=$1
  [ "$n" == 1 ] && echo "" && exit 0
  local primes=()
  local numbers=()
  for test in $(seq 2 "$n"); do
    if [ "${numbers[$test]}" != "false" ]; then
      primes+=("$test")
      for ((i = $test; i <= $n; i += $test)); do
        numbers[$i]="false"
      done
    fi
  done
  echo "${primes[@]}"
}

main "$@"
