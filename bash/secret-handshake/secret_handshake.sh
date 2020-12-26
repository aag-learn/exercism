#!/usr/bin/env bash

# See https://unix.stackexchange.com/questions/203003/bash-decimal-to-binary-conversion-explanation
#D2B=({0..1}{0..1}{0..1}{0..1}{0..1})

DATA=(1 2 4 8)

main () {
  local binary=$(decimal_to_binary $1)
  local encoded=()
  local output=""

  for I in "${DATA[@]}"; do
    case  $(( $I & $1 )) in
      1 ) encoded+=('wink') ;;
      2 ) encoded+=('double blink') ;;
      4 ) encoded+=('close your eyes') ;;
      8 ) encoded+=('jump') ;;
      * ) ;;
    esac 
  done

  if [ "${#encoded[@]}" = "0" ]; then
    echo ""
  elif [ "${#encoded[@]}" = "1" ]; then
    echo "${encoded[0]}"
  else
  
    if [ $(( 16 & $1 )) = "0" ]; then  
      for I in "${encoded[@]}"; do
        output+="$I,"
      done
    else
      local last="${#encoded[@]}"
      for (( i=$last-1 ; i>=0 ; i-- ));do
        output+="${encoded[i]},"
      done  
    fi

    local len=${#ouput} 
    output=${output::len-1}

    echo $output

  fi
}

# call main with all of the positional arguments
main "$@"