#!/bin/bash

site=your-website-here-production
serverip=10.11.11.11
serverport=5522
backups=/home/your-user/your-backups-folder/

date=$(date '+%Y-%m-%d')

echo "--------------------------------------------------------"
echo " BACKUP $site"
echo "--------------------------------------------------------"
echo "Today: "$date
destination=$backups$site-$date
mkdir $destination
echo "Created folder: "$destination
rsync -avz -e 'ssh -p '$serverport' -i ~/.ssh/key' root@$serverip:/database-path-here/filestorage $destination
rsync -avz -e 'ssh -p '$serverport' -i ~/.ssh/key' root@$serverip:/database-path-here/blobstorage $destination
