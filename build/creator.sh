#!/bin/bash

cd /usr/lib/clusterhat-image/

source ./config.sh

ARCH=armhf

DIST="bullseye"
VER="2023-05-03"
IMGDIR="raspios_lite_armhf-${VER}"
REPO="https://downloads.raspberrypi.org/raspios_lite_armhf"
EDITION="raspios"
IMGNAME="${VER}-${EDITION}-${DIST}-${ARCH}-lite.img.xz"
IMGURL="${REPO}/images/raspios_lite_armhf-${VER}/${IMGNAME}"

mkdir -p $SOURCE
mkdir -p $DEST
#sudo rm -rfv $DEST/*
mkdir -p $MNT
mkdir -p $MNT2

if [ ! -f $SOURCE/$IMGNAME ]; then
    echo Getting $IMGURL to $SOURCE
    cd $SOURCE
    sudo wget -c "$IMGURL" -O $IMGNAME
    sudo xz -v --decompress $IMGNAME
    cd ..
else
    echo We have $IMGURL from $SOURCE
    ls -la $SOURCE/$IMGNAME
fi

cd /usr/lib/clusterhat-image/

sudo ./create.sh $VER

ls -la /var/lib/clusterhat-image/dest/*
