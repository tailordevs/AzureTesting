#!/usr/bin/env sh

# http://stackoverflow.com/questions/878600/how-to-create-cronjob-using-bash
# http://stackoverflow.com/questions/4880290/how-do-i-create-a-crontab-through-a-script
# http://stackoverflow.com/questions/14450866/search-for-a-cronjob-with-crontab-l/14451184#14451184

JOB='*/5 * * * * /path/to/job -with args'

FINDJOB=$(crontab -l | grep -F "$JOB")

echo " "

if [ -z "$FINDJOB" ]
then
  echo "Cron job doesn't exist yet, adding it to crontab"

  (crontab -l 2>/dev/null; echo "$JOB") | crontab -
else
  echo "Cron job already added!"
fi

echo " "
echo "Contents of crontab: (crontab -l)"

crontab -l

echo " "
echo "To edit cron manually, execute: 'crontab -e'"
echo " "
