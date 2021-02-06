# Cluster HAT

![InAction](clusterhat.jpeg?raw=true)

Scripts and files used to build Cluster HAT images from Raspbian.


Installation
------------

```shell
sudo apt install lsb-release wget
echo "deb http://repo.vitexsoftware.cz $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/vitexsoftware.list
sudo wget -O /etc/apt/trusted.gpg.d/vitexsoftware.gpg http://repo.vitexsoftware.cz/keyring.gpg
sudo apt update
sudo apt install clusterhat-image
```


Usage
-----

Simply run 
```shell
clusterhat-creator
```
to download initial images and build ClusterHat ones


To write all your reqied images you can use our write helper script

```shell
/usr/lib/clusterhat-image/writer.sh
```
![X](writer.png?raw=true)


Note: Please use https://github.com/Vitexus/gnome-multi-writer/releases/tag/3.35.91 version of Gnom MultiWriter


## Building Cluster HAT Images

The build script is located in the build directory.

The following is normally ran as root on a fresh Raspbian images.

```
git clone https://github.com/burtyb/clusterhat-image
cd clusterhat-image/build/
# Create a config-local.sh file and copy any lines you need to override from config.sh
./create 2017-09-07
```

The "2017-09-07" date above should be the date from the Raspbian/Raspberry Pi OS image you wish to convert.

When building arm64 images you need to be on an arm64 machine.



## Cluster HAT Files

The files/ directory contains the files extracted into the root filesystem of a Cluster HAT image.

For support contact: https://secure.8086.net/billing/submitticket.php?step=2&deptid=1

