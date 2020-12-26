#!/usr/bin/env bash

# See https://unix.stackexchange.com/questions/203003/bash-decimal-to-binary-conversion-explanation
#D2B=({0..1}{0..1}{0..1}{0..1}{0..1})

DATA=(1 2 4 8)
SHOULD_REVERSE="false"

function output() {
  local encoded=("$@")

  if [ "${#encoded[@]}" = "0" ]; then
    echo ""
  elif [ "${#encoded[@]}" = "1" ]; then
    echo "${encoded[0]}"
  else
    if [ "$SHOULD_REVERSE" = "false" ]; then  
      for I in "${encoded[@]}"; do
        output+="$I,"
      done
    else
      local last="${#encoded[@]}"
      for (( i=$last-1 ; i>=0 ; i-- ));do
        output+="${encoded[i]},"
      done  
    fi

    # Remove trailing comma
    local len=${#ouput} 
    output=${output::len-1}

    echo $output

  fi

}

main () {
  local encoded=()
  local output=""
  
  [[ $(( 16 & $1 )) != "0" ]] && SHOULD_REVERSE="true"

  # We need to use double quotes so elements with multiple words separated with spaces count as one
  for I in "${DATA[@]}"; do
    case  $(( $I & $1 )) in
      1 ) encoded+=('wink') ;;
      2 ) encoded+=('double blink') ;;
      4 ) encoded+=('close your eyes') ;;
      8 ) encoded+=('jump') ;;
      * ) ;;
    esac 
  done

  output "${encoded[@]}"
}

# call main with all of the positional arguments
main "$@"