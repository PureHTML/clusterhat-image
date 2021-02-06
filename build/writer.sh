#!/bin/bash

BALENA=/usr/bin/balena-etcher-electron
if [ -f "$BALENA" ]; then
    WRITER="/usr/bin/balena-etcher-electron"
else 
    #Please Use  version wtih -i support  https://github.com/Vitexus/gnome-multi-writer/releases/tag/3.35.91
    WRITER="/usr/bin/gnome-multi-writer -i "
fi


cd "$(dirname "$0")"

source ./config.sh

# Please use https://github.com/Vitexus/gnome-multi-writer/releases/tag/3.35.91


IMAGES=`ls $DEST`

OPTIONS=" "
for IMG in $IMAGES
do
    OPTIONS+="$IMG off "
done

cmd=(dialog --stdout --no-items --separate-output --ok-label "Write images" --checklist "Please choose images to write" 44 76 16)
WRITE=$("${cmd[@]}" ${OPTIONS})

for IMG in $WRITE
do
    sudo $WRITER $DEST/$IMG
done
