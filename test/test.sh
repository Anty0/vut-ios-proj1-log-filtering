#!/bin/zsh

# TODO: dash
call_wana() {
    printf "wana %s\\n" "$1" >&2
    cd ../logs && eval "../wana $1"
}

for file in ./args/*; do
    file_name=${file##*/}
    printf "Test %s\\n" "$file_name"
    args="$( cat "$file" )"
    diff <( call_wana "$args" ) "./out/$file_name"
done