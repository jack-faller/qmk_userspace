#!/bin/sh
set -ev
cd "$(dirname "$(realpath "$0")")"
KEYBOARD="$1"
KEYMAP="$2"
LOCATION="./keyboards/$KEYBOARD/keymaps/$KEYMAP"
# You can plug the USB into either half if you flash the right half with a map
# that has all the keys mirrored along the vertical axis.
rm -rf "$LOCATION"_flipped
cp -r "$LOCATION" "$LOCATION"_flipped
rm "$LOCATION"_flipped/keymap.json
./json_flipper "$LOCATION"/keymap.json > "$LOCATION"_flipped/keymap.json
