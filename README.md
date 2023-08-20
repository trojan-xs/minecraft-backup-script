<p align="center">
  <img src="./assets/server-image.png" width="250" />
</p>

# universal-backup-script
The script serves as a versatile backup and maintenance tool designed originally for Minecraft servers' backup needs. It enables users to create compressed backups of source directories, maintain detailed logs of backup and clearing operations, and optionally automate the removal of older archive files. The script's flexibility allows users to safeguard important data, conserve storage space, and streamline backups.
Written in Bash with the assistance of our beloved ChatGPT.


# Installation
```
wget https://raw.githubusercontent.com/trojan-xs/universal-backup-script/main/backup.sh
```

# Usage

```
Options:
-h, --help                         Display this help message
-t, --target <dir>                 Set the source directory for backup (default: /path/to/target)
-d, --destination <dir>            Set the destination directory for backups (default: /path/to/destination/)
-bkl, --backup-log <file>          Set the backup logfile path (default: /path/to/backup.log)
-m, --maxfiles <num>               Set the maximum number of files to keep (default: 10)
-del, --delete-old <true|false>    Perform delete old operation (delete old archive files) [default: false]
-cl, --clear-log <file>            Set the clear logfile path (default: /path/to/delete.log)                     
```
Example:
```
./backup.sh -t /home/user/directory -d home/user/backups/ -bkl /home/user/backups/backup.log -m 5 -del true -cl /home/user/backups/cleared.log
```


# Scheduling
This script is used with crontab. Specify the frequency of execution through crontab.
```
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of the month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday 7 is also Sunday on some systems)
# │ │ │ │ │ ┌───────────── command to issue                               
# │ │ │ │ │ │
# │ │ │ │ │ │
# * * * * * /bin/bash {Location of the script} {Script flags}
```
stolen from K0p1-Git's cloudflare-ddns-updater

# Features to add
- Simple graphical interface to specify directory locations and to edit cron file
- Ability to transfer files (scp or sftp) to another server for redundancy


