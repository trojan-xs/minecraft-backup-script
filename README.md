<p align="center">
  <img src="./assets/server-save.png" width="802" />
</p>

# minecraft-backup-script
This script is used to back up and archive your Linux Minecraft server! Written in Bash with the assistance of our beloved ChatGPT.

# Installation
```
git clone https://github.com/trojan-xs/minecraft-backup-script.git
```

# Usage

```
Options:
-h, --help                         Display this help message
-t, --target <dir>                 Set the source directory for backup (default: /path/to/target)
-d, --destination <dir>            Set the destination directory for backups (default: /path/to/destination/)
-bkl, --backup-log <file>          Set the backup logfile path (default: /path/to/backup.log)
-m, --maxfiles <num>               Set the maximum number of files to keep (default: 10)
-del, --delete-old <true|false>    Perform delete old operation (delete old archive files) [default: 0]
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
Flags for file directories, backup frequency, etc.
