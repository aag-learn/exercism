#!/usr/bin/env bash

function two_fer { 
    local for_you="One for ${1:-you}"
    local for_me="one for me."
    echo "$for_you, $for_me"
}

main () {
    two_fer "$@"
}

main "$@"