-- Database Backup and Restore Procedures for Attendance Management System

-- This file contains instructions and sample commands for backing up and restoring the database.

-- BACKUP PROCEDURES:

-- 1. Using mysqldump command (CLI):
--    Replace 'username', 'password', 'hostname' with actual values.
--    This creates a full backup of the attendance_management_system database.
--
--    mysqldump -u username -p password -h hostname attendance_management_system > backup_$(date +%Y%m%d_%H%M%S).sql

-- 2. Using phpMyAdmin:
--    - Log in to phpMyAdmin
--    - Select the 'attendance_management_system' database
--    - Click on 'Export' tab
--    - Choose 'Quick' export method or 'Custom' for more options
--    - Select format: SQL
--    - Click 'Go' to download the backup file

-- 3. Full database dump (sample SQL):
--    This is a sample structure; run mysqldump to get actual data.

-- RESTORE PROCEDURES:

-- 1. Using MySQL command (CLI):
--    Replace 'username', 'password', 'hostname', 'backup_file.sql' with actual values.
--    Note: Database must exist or create it first.
--
--    CREATE DATABASE IF NOT EXISTS attendance_management_system;
--    mysql -u username -p password -h hostname attendance_management_system < backup_file.sql

-- 2. Using phpMyAdmin:
--    - Log in to phpMyAdmin
--    - If database doesn't exist, create it first: Click 'Databases' > Enter name > Create
--    - Select the 'attendance_management_system' database
--    - Click on 'Import' tab
--    - Choose the backup file (.sql)
--    - Click 'Go' to restore

-- AUTOMATED BACKUP SCRIPT EXAMPLE (for Linux/Unix systems):
-- Save this as a script and run with cron for automated backups.

/*
#!/bin/bash
BACKUP_DIR="/path/to/backup/directory"
DATE=$(date +%Y%m%d_%H%M%S)
mysqldump -u username -p'password' attendance_management_system > $BACKUP_DIR/attendance_backup_$DATE.sql

# Optional: Keep only last 30 backups
find $BACKUP_DIR -name "attendance_backup_*.sql" -type f -mtime +30 -delete
*/

-- NOTES:
-- - Always test restore procedures on a development environment before using on production
-- - Regularly schedule backups to prevent data loss
-- - Store backups in secure locations with proper access controls
-- - Include date and time in backup filenames for versioning