# minecraft-backup-script
This script is used to back up and archive your Linux Minecraft server! Written in Bash with the assistance of our beloved ChatGPT.

# Installation
```
git clone https://github.com/trojan-xs/minecraft-backup-script.git
```

# Usage
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
# * * * * * /bin/bash {Location of the script}
```
stolen from K0p1-Git's cloudflare-ddns-updater

# Features to add
Flags for file directories, backup frequency, etc.
