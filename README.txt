HOW TO USE:
Put something like the table below to the crontab

# m h  dom mon dow   command
  0 0  *   *   *     /root/backups/scripts/backup.sh nightly > /root/backups/logs/logs.txt  2> /root/backups/logs/errors.txt

TODO:
1. Add possibility for encription
2. Use getopts
3. Add possibility to set all-in-one archive name
