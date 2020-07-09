HOW TO USE:
Put adding environment paths and something like the table below to the crontab

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin  #This is really matter since without it scipts may not work

# m h  dom mon dow   command
  0 0  *   *   *     /root/backups/scripts/backup.sh nightly > /root/backups/logs/logs.txt  2> /root/backups/logs/errors.txt

TODO:
1. Add possibility for encription
2. Use getopts
3. Add possibility to set all-in-one archive name
