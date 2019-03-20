#!/bin/zsh

call_wana() {
    printf "%s wana %s\\n" "$1" "$2" >&2
    cd ../logs && eval "$1 ../wana $2"
}

for file in ./args/*; do
    file_name=${file##*/}
    printf "Test %s\\n" "$file_name"
    args="$( cat "$file" )"
    if command -v dash >/dev/null; then
        diff <( call_wana "dash" "$args" ) "./out/$file_name"
    fi
    if command -v bash >/dev/null; then
        diff <( call_wana "bash" "$args" ) "./out/$file_name"
    fi
    if command -v zsh >/dev/null; then
        diff <( call_wana "zsh" "$args" ) "./out/$file_name"
    fi
done