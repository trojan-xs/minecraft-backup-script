#!/bin/bash

# Default values for backup
default_dir_to_archive="/path/to/target"
default_archive_dir="/path/to/destination/"
default_backup_log_file="/path/to/backup.log"

# Default values for clear
default_max_files=10
default_clear_log_file="/path/to/delete.log"
default_delete_old_flag=0

# Initialize variables with default values for backup
dir_to_archive="$default_dir_to_archive"
archive_dir="$default_archive_dir"
backup_log_file="$default_backup_log_file"

# Initialize variables with default values for clear
max_files="$default_max_files"
clear_log_file="$default_clear_log_file"
delete_old_flag="$default_delete_old_flag"

# Function to create a log file if it doesn't exist
create_log_file() {
    if [ ! -f "$1" ]; then
        touch "$1"
    fi
}

# Function to display help message
show_help() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -h, --help                  Display this help message"
    echo "  -t, --target <dir>          Set the source directory for backup (default: $default_dir_to_archive)"
    echo "  -d, --destination <dir>     Set the destination directory for backups (default: $default_archive_dir)"
    echo "  -bkl, --backup-log <file>   Set the backup logfile path (default: $default_backup_log_file)"
    echo "  -m, --maxfiles <num>        Set the maximum number of files to keep (default: $default_max_files)"
    echo "  -del, --delete-old <true|false> Perform delete old operation (delete old archive files) [default: $default_delete_old_flag]"
    echo "  -cl, --clear-log <file>     Set the clear logfile path (default: $default_clear_log_file)"
}

# Process arguments and options
while [[ $# -gt 0 ]]; do
    case $1 in
        -h | --help)
            show_help
            exit 0
            ;;
        -t | --target)
            dir_to_archive="$2"
            shift 2
            ;;
        -d | --destination)
            archive_dir="$2"
            shift 2
            ;;
        -bkl | --backup-log)
            backup_log_file="$2"
            create_log_file "$backup_log_file"  # Create backup log file if it doesn't exist
            shift 2
            ;;
        -m | --maxfiles)
            max_files="$2"
            shift 2
            ;;
        -del | --delete-old)
            delete_old_flag="$2"
            shift 2
            ;;
        -cl | --clear-log)
            clear_log_file="$2"
            shift 2
            ;;
        *)
            echo "Invalid option or argument: $1. Use -h or --help for usage information." >&2
            exit 1
            ;;
    esac
done

# Create clear log file if it doesn't exist
create_log_file "$clear_log_file"

# Backup

# Define the name of the archive file
archive_name="$(date +%Y-%m-%d-%H-%M).tar.gz"

# Create the archive and save it to the specified directory
tar -czvf "$archive_dir/$archive_name" "$dir_to_archive"

# Log the time of backup and the path to the archived files
archive_size=$(du -h "$archive_dir/$archive_name" | awk '{print $1}')
echo "Time of backup: $(date +%Y-%m-%d-%H-%M)" >> "$backup_log_file"
echo -e "Archived files: $archive_dir/$archive_name (size: $archive_size)\n" >> "$backup_log_file"

# Output the list of archive files
echo "Archived files:"
ls -lh "$archive_dir/$archive_name"

# Clear

if [[ "$delete_old_flag" == "true" ]]; then
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
        echo "Time of deletion: $current_time" >> "$clear_log_file"
        echo "Deleted files:" >> "$clear_log_file"
        echo "$deleted_files" >> "$clear_log_file"
        echo "" >> "$clear_log_file"

        echo "Deleted files:"
        echo -e "$deleted_files\n"
    fi
else
    # Delete old script skipped, update logfile
    echo "Delete old script skipped - $(date "+%Y-%m-%d-%H-%M")" >> "$clear_log_file"
fi

