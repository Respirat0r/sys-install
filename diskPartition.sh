#!/bin/bash

#fdisk or cfdisk
echo "fdisk[1] or cfdisk[2]?"
read disk
if [[ $disk == 1 ]]; then
    fdisk -l
    echo "Enter your disks name: (example: /dev/sda, /dev/sdb)"
    read diskName
    fdisk $diskName
elif [[ $disk == 2 ]]; then
    cfdisk
else
    echo pashol nahui
fi

# Boot Partitioning

echo "Which is your boot partition? (example: /dev/sda1, /dev/sdb2)"
read bootName
mkfs.ext2 $bootName
mount $bootName /boot

# Root Partitioning

echo "Which is your root partition? (example: /dev/sda1, /dev/sdb2)"
read rootName
mkfs.ext4 $rootName
mount $rootName /mnt

# Swap partitioning

echo "Do you have swap partition? Yes[1], No[2]"
read VAR
if [[ $VAR == 1 ]]; then
    echo "Which is your swap partition? (example: /dev/sda1, /dev/sdb2)"
    read swapName
    mkswap $swapName
    swapon $swapName
elif [[ $VAR == 2 ]]; then
    echo "Oki, continue"
fi