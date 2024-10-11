#!/bin/sh	#?? Specify the shell interpreter

# Define the directory where WordPress is installed
wp_dir='/var/www/html'

# Check if the WordPress configuration file does not exist
if [ ! -e "${wp_dir}/wp-config.php" ]
then

	# Create the WordPress confuiguration file with the specified database settings
	wp config create	--allow-root \
				--dbname=$DB_NAME \		# Database name
				--dbuser=$DB_USER \		# Database user
				--dbpass=$DB_PASS \		# Database password
				--dbhost=mariadb:3306 \		# Database host
				--path=$wp_dir			# WP install path

	# Install WordPress core files
	wp core install		--allow-root \
				--url=$WP_URL \				# Site URL
				--title=$WP_TITLE \			# Site title
				--admin_email=$WP_ADMIN_EMAIL \		# Admin email
				--admin_user=$WP_ADMIN \		# Admin username
				--admin_password=$WP_ADMIN_PASS \	# Admin password
				--path=$wp_dir				# WP install path

	# Create a new WordPress user
	wp user create		--allow-root \			
				$WP_USER $WP_USER_EMAIL \	# New user and email
				--user_pass=$WP_USER_PASS \	# New user's password 
				--path=$wp_dir			# WP installation path

fi

# Start the PHP FastCGI Process Manager in the foreground
/usr/sbin/php-fpm82 -F
