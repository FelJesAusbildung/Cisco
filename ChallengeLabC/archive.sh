#!/bin/bash
[[ -d "~/archive" ]] && mkdir ~/archive
cd /var/log
echo "~Creating log.tar with verbose output:"
tar -cvf ~/archive/log.tar *.log

echo
echo "~Listing contents of log.tar without extracting:"
tar -tf ~/archive/log.tar

[[ -d "~/backup" ]] && mkdir ~/backup
cd ~/backup
tar -xf ~/archive/log.tar
echo
echo "~Listing extracted files in ~/backup:"
ls
