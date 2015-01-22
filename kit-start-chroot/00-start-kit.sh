#!/bin/bash
mount -t proc none UTUTOXS-Filesystem.$1/proc
mount -o bind /dev UTUTOXS-Filesystem.$1/dev

chroot UTUTOXS-Filesystem.$1 /bin/bash -c mc

umount UTUTOXS-Filesystem.$1/dev
umount UTUTOXS-Filesystem.$1/proc
