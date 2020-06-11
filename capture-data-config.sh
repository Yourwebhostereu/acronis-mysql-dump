#!/usr/bin/env bash
DIR="$(dirname "${BASH_SOURCE[0]}")"

LOGFILE="$DIR/log/mysql_dump.log"

MYSQL_USER=
MYSQL_PASSWORD_PATH=

# You can configure the following parameters. Please read the user's guide before editing the parameters.

# NICE
# Set the bin and priority.
nice_bin=`which nice`
nice_priority=15

# MYSQL
mysql_bin=`which mysql`

# MYSQLDUMP
mysqldump_bin=`which mysqldump`
mysqldump_parameters='--force --single-transaction --events --routines --opt'

# WHERE TO STORE THE DATA
backup_path="$DIR/backup"

if [ -f /root/.my.cnf ]; then
    echo "$(date -Ins) - MySQL .my.cnf exists." >> "$LOGFILE"
    MYSQL_USER=`awk -F "=" '/user/ {print $2}' /root/.my.cnf`
    MYSQL_PASSWORD=`awk -F "=" '/password/ {print $2}' /root/.my.cnf`
elif [ -f /usr/local/directadmin/conf/my.cnf ]; then
    echo "$(date -Ins) - DirectAdmin detected - loading my.cnf." >> "$LOGFILE"
    MYSQL_USER=`awk -F "=" '/user/ {print $2}' /usr/local/directadmin/conf/my.cnf`
    MYSQL_PASSWORD=`awk -F "=" '/password/ {print $2}' /usr/local/directadmin/conf/my.cnf`
fi

echo "[client]
user=$MYSQL_USER
password=$MYSQL_PASSWORD
" > $DIR/conf/my_extra.cnf 

echo $DIR/conf/my_extra.cnf >> "$LOGFILE"
