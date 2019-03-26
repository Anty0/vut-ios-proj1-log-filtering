#!/bin/zsh

call_wana() {
    printf "%s wana %s\\n" "$1" "$2" >&2
    cd ../logs && eval "$1 ../wana $2"
}

for file in ./args/*; do
    file_name=${file##*/}
    printf "Test %s\\n" "$file_name"
    args="$( cat "$file" )"
    for shell in "$@"; do
        if command -v "$shell" >/dev/null; then
            diff <( call_wana "$shell" "$args" ) "./out/$file_name"
        fi
    done
done