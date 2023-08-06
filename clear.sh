#!/bin/bash

# Define the directory where the archive files are stored
archive_dir="/home/server/mcbks"

# Define the maximum number of archive files to keep
max_files=14

# Define the path to the deletion log file
log_file="/home/server/mcbks/deleted.log"

# Count the number of archive files in the directory
num_files=$(ls -1 "$archive_dir"/*.tar.gz 2>/dev/null | wc -l)

# If there are more than max_files files, delete the oldest ones
if [ $num_files -gt $max_files ]; then
    # Get the current time
    current_time=$(date "+%Y-%m-%d-%H-%M")

    num_to_delete=$((num_files - max_files))
    echo "Deleting $num_to_delete oldest archive files..."
    deleted_files=$(ls -1 "$archive_dir"/*.tar.gz 2>/dev/null | sort | head -n "$num_to_delete")
    echo "$deleted_files" | xargs rm --

    # Output the names of the deleted files and the time of deletion to the log file
    echo "Time of deletion: $current_time" >> "$log_file"
    echo "Deleted files:" >> "$log_file"
    echo "$deleted_files" >> "$log_file"
    echo "" >> "$log_file"

    echo "Deleted files:"
    echo -e "$deleted_files\n"
fi

