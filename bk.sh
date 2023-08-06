#!/bin/bash

# Define the directory to be archived
dir_to_archive="/home/server/minecraft"

# Define the name of the archive file
archive_name="$(date +%Y-%m-%d-%H-%M).tar.gz"

# Define the directory where the archive will be stored
archive_dir="/home/server/mcbks"

# Create the archive and save it to the specified directory
tar -czvf "$archive_dir/$archive_name" "$dir_to_archive"

# Log the time of backup and the path to the archived files
log_file="/home/server/mcbks/backup.log"
archive_size=$(du -h "$archive_dir/$archive_name" | awk '{print $1}')
echo "Time of backup: $(date +%Y-%m-%d-%H-%M)" >> "$log_file"
echo -e "Archived files: $archive_dir/$archive_name (size: $archive_size)\n" >> "$log_file"

# Output the list of archive files
echo "Archived files: "
ls -lh "$archive_dir/$archive_name"

#Calling Clear script
/home/server/mcbks/clear.sh

