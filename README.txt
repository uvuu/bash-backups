HOW TO USE:
Put something like table below to the crontab

0 0 * * * /root/backups/scripts/backup.sh nightly > /root/backups/logs/log.txt 2> /root/backups/logs/errors.txt

TODO:
1. Add possibility for encription
2. Use getopts
3. Add possibility to set all-in-one archive name
