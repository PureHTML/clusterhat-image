#!/bin/bash


MULTIWRITER="/usr/bin/gnome-multi-writer"
if [ -f "$MULTIWRITER" ]; then
    #Please Use  version wtih -i support  https://github.com/Vitexus/gnome-multi-writer/releases/tag/3.35.91
    WRITER="/usr/bin/gnome-multi-writer -i "
else 
    WRITER="/usr/bin/balena-etcher-electron"
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
    echo Please wait for $IMG to be written. Then close writter gui window to write next one
    sudo $WRITER $DEST/$IMG
done
