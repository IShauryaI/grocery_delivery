#!/bin/bash

# Backup script for Grocery Delivery System
# Usage: ./backup.sh [type]
# Types: database, media, full

set -e

BACKUP_TYPE=${1:-full}
BACKUP_DIR="/var/backups/grocery_delivery"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
APP_DIR="/var/www/grocery_delivery"

# Create backup directory
mkdir -p $BACKUP_DIR

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

backup_database() {
    log "Backing up database..."
    
    # Load environment variables
    if [ -f "$APP_DIR/.env" ]; then
        source $APP_DIR/.env
    fi
    
    # MySQL backup
    if [ "$DATABASE_ENGINE" = "django.db.backends.mysql" ]; then
        mysqldump -h${DATABASE_HOST:-localhost} -u${DATABASE_USER} -p${DATABASE_PASSWORD} ${DATABASE_NAME} > $BACKUP_DIR/db_backup_$TIMESTAMP.sql
        log "MySQL database backup completed: db_backup_$TIMESTAMP.sql"
    
    # SQLite backup
    elif [ -f "$APP_DIR/db.sqlite3" ]; then
        cp $APP_DIR/db.sqlite3 $BACKUP_DIR/db_backup_$TIMESTAMP.sqlite3
        log "SQLite database backup completed: db_backup_$TIMESTAMP.sqlite3"
    fi
}

backup_media() {
    log "Backing up media files..."
    if [ -d "$APP_DIR/media" ]; then
        tar -czf $BACKUP_DIR/media_backup_$TIMESTAMP.tar.gz -C $APP_DIR media/
        log "Media files backup completed: media_backup_$TIMESTAMP.tar.gz"
    fi
}

backup_full() {
    log "Creating full backup..."
    backup_database
    backup_media
    
    # Backup source code (excluding sensitive files)
    tar --exclude='venv' \
        --exclude='.git' \
        --exclude='__pycache__' \
        --exclude='*.pyc' \
        --exclude='.env' \
        --exclude='db.sqlite3' \
        --exclude='media' \
        -czf $BACKUP_DIR/source_backup_$TIMESTAMP.tar.gz -C $(dirname $APP_DIR) $(basename $APP_DIR)/
    
    log "Full backup completed!"
}

cleanup_old_backups() {
    log "Cleaning up old backups (keeping last 7 days)..."
    find $BACKUP_DIR -name "*_backup_*.sql" -mtime +7 -delete
    find $BACKUP_DIR -name "*_backup_*.sqlite3" -mtime +7 -delete
    find $BACKUP_DIR -name "*_backup_*.tar.gz" -mtime +7 -delete
    log "Cleanup completed!"
}

log "Starting backup process..."
log "Backup type: $BACKUP_TYPE"

case $BACKUP_TYPE in
    "database")
        backup_database
        ;;
    "media")
        backup_media
        ;;
    "full")
        backup_full
        ;;
    *)
        log "Unknown backup type: $BACKUP_TYPE"
        log "Available types: database, media, full"
        exit 1
        ;;
esac

cleanup_old_backups

log "Backup process completed!"
log "Backup files are stored in: $BACKUP_DIR"