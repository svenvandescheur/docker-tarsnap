#!/bin/bash

# Svenv.nl Tarsnap backup script
# Creates new and removes old backups

# Summary:
# --------
# * Fix errors
# * Create media backup
# * Create database backup
# * Remove old backups (for performance)


# Fix errors
/usr/local/bin/tarsnap --fsck

# Create media backup
/usr/local/bin/tarsnap -c -f `date +\%Y\%m\%d\%H\%M\%S`-`hostname`-svenv.nl/media /srv/nginx/svenv/media/

# Create database backup
/usr/local/bin/tarsnap -c -f `date +\%Y\%m\%d\%H\%M\%S`-`hostname`-svenv.nl/database /srv/postgresql/

# Remove old backups (for performance)
for i in $(/usr/local/bin/tarsnap --list-archives | sort -r | tail -n +201); do /usr/local/bin/tarsnap -d -f $i; done
