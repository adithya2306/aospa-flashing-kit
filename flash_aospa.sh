#!/bin/bash
# Flash AOSPA fastboot zip on marble
# Author: Adithya R (@ghostrider_reborn)

function wait_exit() {
    read -p "Press enter to exit..."
    exit $1
}

# ROM zip must be stored as aospa.zip
if [ ! -f "aospa.zip" ]; then
    echo "Error: aospa.zip not found, download and place it first."
    wait_exit 1
fi

tools_path="platform-tools-linux"
[ "$(uname -s)" = "Darwin" ] && tools_path="platform-tools-darwin"

if ! "./$tools_path/fastboot" update --skip-reboot aospa.zip; then
    echo -e "\nError: Flashing failed!"
    wait_exit 1
fi

echo -e "\nCompleted succesfully!"
wait_exit
