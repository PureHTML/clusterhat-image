#!/bin/bash

cd "$(dirname "$0")"

source ./config.sh

ARCH=arhmf

VER="2021-01-11"
DIST="buster"
IMGDIR="raspios_lite_armhf-2021-01-12"

DIST="buster"
VER="2021-01-11"
IMGDIR="raspios_lite_armhf-2021-01-12"
REPO="https://downloads.raspberrypi.org/raspios_lite_armhf"
EDITION="raspios"
IMGNAME="${VER}-${EDITION}-${DIST}-${ARCH}-lite.zip"
IMGURL="${REPO}/images/${IMGNAME}"
IMGURL="https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2021-01-12/2021-01-11-raspios-buster-armhf-lite.zip"


#DIST="stretch"
#VER="2017-08-16"
#IMGDIR="raspbian_lite-2017-08-17"
#REPO="http://ftp.jaist.ac.jp/pub/raspberrypi/raspbian_lite"
#EDITION="raspbian"
#IMGNAME="2017-08-16-raspbian-stretch-lite.zip"
#IMGURL="http://ftp.jaist.ac.jp/pub/raspberrypi/raspbian_lite/images/raspbian_lite-2017-08-17/2017-08-16-raspbian-stretch-lite.zip"

mkdir -p $SOURCE
mkdir -p $DEST
#sudo rm -rfv $DEST/*
mkdir -p $MNT
mkdir -p $MNT2



if [ ! -f $SOURCE/$IMGNAME ]; then
    echo Getting $IMGURL to $SOURCE
    cd $SOURCE
	sudo wget -c "$IMGURL"  -O $IMGNAME
	sudo unzip $IMGNAME
    cd ..
else
    echo We have $IMGURL from $SOURCE
    ls -la $SOURCE/$IMGNAME
fi


cd "$(dirname "$0")"

sudo ./create.sh $VER

ls -la /var/lib/clusterhat-image/dest/*




