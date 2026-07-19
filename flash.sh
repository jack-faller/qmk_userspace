#!/bin/sh
set -ex
cd "$(dirname "$(realpath "$0")")"
KEYBOARD="$1"
KEYMAP="$2"
case "$3" in
    right | "")
        SIDE=right
        FLIPPED=_flipped
        ./make_flipped.sh "$KEYBOARD" "$KEYMAP"
        ;;
    left)
        SIDE=left
        FLIPPED=""
        ;;
esac
exec qmk flash -j 4 -kb "$KEYBOARD" -km "$KEYMAP$FLIPPED" --bootloader "dfu-util-split-$SIDE"
