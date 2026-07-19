#!/bin/sh
set -ex
cd "$(dirname "$(realpath "$0")")"
KEYBOARD="$1"
KEYMAP="$2"
LOCATION="./keyboards/$KEYBOARD/keymaps/$KEYMAP"
# You can plug the USB into either half if you flash the right half with a map
# that has all the keys mirrored along the vertical axis.
mkdir "$LOCATION"_flipped || true
cd "$LOCATION"_flipped
find . -maxdepth 1 -mindepth 1 ! -name keymap.json -delete
find ../"$KEYMAP" -maxdepth 1 -mindepth 1 ! -name keymap.json -exec ln --symbolic --force --target-directory . {} +
JSON=../"$KEYMAP"/keymap.json
if [ "$JSON" -nt keymap.json ]; then
    ./json_flipper "$JSON" > keymap.json
fi
