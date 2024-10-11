#!/bin/sh	#?? Specify the shell interpreter

# Start MariaDB in the background without attaching to the terminal
mariadbd-safe --nowatch

# Loop until MariaDB is ready to accept connections
while ! mariadb-check -A
do
	sleep 1
done

# Create the database if it doesn't exist
mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
# Create a user with specified username and password
mariadb -e "CREATE USER IF NOT EXISTS $DB_USER@'localhost' IDENTIFIED BY '$DB_PASS';"
# Grant all privileges on the database to the user, allowing remote access
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%' IDENTIFIED BY '$DB_PASS';"
# Reload previleges tables to apply changes
mariadb -e "FLUSH PRIVILEGES;"

# Set the root password for MariaDB
mariadb-admin -u root password "$DB_PASS"
# Shut down the mariaDB server
mariadb-admin -u root -p"$DB_PASS" shutdown

# Create a file to signal that the setup is complete
touch /good

# Start MariaDB in the foreground
mariadbd-safe
