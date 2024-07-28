#!/usr/bin/env bash

main() {
  local n=$1
  [ "$n" == 1 ] && echo "" && exit 0
  local primes=()
  local numbers=()
  for test in $(seq 2 "$n"); do
    if [ "${numbers[$test]}" != "false" ]; then
      primes+=("$test")
      for ((i = test; i <= n; i += test)); do
        numbers[i]="false"
      done
    fi
  done
  echo "${primes[@]}"
}

main "$@"
