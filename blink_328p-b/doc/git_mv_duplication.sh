#!/bin/sh

echo "Produces only echo - no action otherwise.  SAFE."

echo
echo "See the script itself.  Exiting."

exit 0

for index in \
    "../blink_328p-a/blinking.S" \
    "../blink_328p-a/diagram.json" \
    "../blink_328p-a/README.md" \
    "../blink_328p-a/thing.ino" \
    "../blink_328p-a/things.cpp" \
    "../blink_328p-a/wokwi-project.txt"
    do
        echo "  git checkout HEAD~   ${index} # rem"
    done
exit 0
