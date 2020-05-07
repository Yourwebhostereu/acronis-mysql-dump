#!/usr/bin/env bash

DIR="$(dirname "${BASH_SOURCE[0]}")"

echo "$(date -Ins) ---------------------------------------------------------------------" >> "$LOGFILE"

echo "$(date -Ins) - REMOVING DATABASE BACKUPS." >> "$LOGFILE"

source "$DIR"/capture-data-config.sh
rm -rf "$backup_path/*.gz"

echo "$(date -Ins) - DONE." >> "$LOGFILE"
