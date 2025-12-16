# Cluster HAT

![InAction](clusterhat.jpeg?raw=true)

Scripts and files used to build [Cluster HAT](https://clusterhat.com/) images from [Raspbian](https://www.raspberrypi.org/software/operating-systems/).



Installation
------------

Please add the software sources first:

```shell
sudo apt install lsb-release wget
echo "deb http://repo.vitexsoftware.com $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/vitexsoftware.list
sudo wget -O /etc/apt/trusted.gpg.d/vitexsoftware.gpg http://repo.vitexsoftware.com/keyring.gpg
sudo apt update
```
Then you can install packages:

* `clusterhat-image`  - Image Creator
* `clusterctl`        - Clusterctl
* `clusterctl-usbboot`- USB Boot support for clusterctl

Usage
-----

Simply run 
```shell
clusterhat-creator
```
to download initial images and build ClusterHat ones

ClusterCTL
----------

Install package **clusterctl** for /usr/sbin/clusterctl commad

You can also turn several PiZeros using **chtui** command

```
sudo /usr/sbin/chtui
```

![chtui](chtui.png?raw=true)


Note: PiZero state is restored at the host boot using /lib/systemd/system/clusterctrl-state.service


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

## Building on x86_64

Images can be built from other architectures using qemu (tested on x86_64 but may work on others)

For example on Debian 12 to do this you need to "apt install qemu-user-static".

Then follow the standard steps

## Cluster HAT Files

The files/ directory contains the files extracted into the root filesystem of a Cluster HAT image.

For support contact: https://secure.8086.net/billing/submitticket.php?step=2&deptid=1

