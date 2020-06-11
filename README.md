# Acronis MySQL dump script
Makes a mysql dump of all your databases.

## Requirements
1. Your backup is created using [our documentation](https://support.yourwebhoster.eu/en-us/article/91-backup-mysql-using-acronis-cloud-backup) but with this repository instead.
2. The MySQL data in the backup is not corrupted.

## How to install
1. Run the code below.
2. Configure /var/lib/Acrons/mysql/pre-command.sh as pre-command.

```
cd /var/lib/Acronis/
git clone https://github.com/Yourwebhostereu/acronis-mysql-dump.git mysql
```

## How to restore a database
1. Restore the .sql/gz file to the server.
2. Run gunzip *.sql.gz (replace * with the filename or let Linux do the magic if no other files are present).
3. Run mysql -u username -p database_name < database_name.sql

# FAQ
## Q: When should I use this script?
A: When you use Acronis backup for DirectAdmin of an other panel.

## Q: Where can I get low-prices Acronis backup storage?
A: You can [order Acronis backup in The Netherlands for just € 0.02 per GB at Yourwebhoster.eu](https://www.yourwebhoster.eu/acronis-backup/).

## Q: Can I use this with the control panels Plesk and cPanel?
A: There is native integration available for these panels. [Learn how to backup cPanel with Acronis here](https://support.yourwebhoster.eu/en-us/article/89-backup-cpanel-with-acronis-cloud-backup) and [learn how to backup Plesk with Acronis here](https://support.yourwebhoster.eu/en-us/article/90-backup-plesk-with-acronis-cloud-backup).

## Q: I have problems with restoring my backup from Acronis
A: [Contact us here (English and Dutch support available)](https://support.yourwebhoster.eu/en-us/conversation/new)

## Q: Can I resell Acronis backup (whitelabel) and use this script?
A: Yes, you can sell Acronis backup for servers, desktops, smartphones, cloud (office365, Gsuite) and more. [Contact us for more information.](https://support.yourwebhoster.eu/en-us/conversation/new)
