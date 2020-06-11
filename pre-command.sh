#!/usr/bin/env bash

set -euo pipefail

DIR="$(dirname "${BASH_SOURCE[0]}")"

source "$DIR"/capture-data-config.sh

echo "$(date -Ins) ---------------------------------------------------------------------" >> "$LOGFILE"

echo "$(date -Ins) - Pre-backup database dump script started." >> "$LOGFILE"

for database in $(mysql --defaults-extra-file=$DIR/conf/my_extra.cnf -e 'show databases' -s --skip-column-names); do
	
	# We cannot dump information_schema
	if [ $database == "information_schema" ] || [ $database == "performance_schema" ]; then
		continue;
	fi
	
	echo "$(date -Ins) - Starting with $database" >> "$LOGFILE"
	$nice_bin -n $nice_priority $mysqldump_bin --defaults-extra-file=$DIR/conf/my_extra.cnf $mysqldump_parameters $database | $nice_bin -n $nice_priority gzip > "$backup_path/$database.sql.gz"
	echo "$(date -Ins) - Done with $database" >> "$LOGFILE"
done
echo "$(date -Ins) - Pre-backup database dump script finished." >> "$LOGFILE"
