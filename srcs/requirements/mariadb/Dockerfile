# Use Alpine Linux version 3.19 as the base image
FROM alpine:3.19

# Update package manager and upgrade existing packages
RUN apk update && apk upgrade
# Install MariaDB and MariaDB client without cache to save space
RUN apk add --no-cache mariadb mariadb-client

# Copy custom MariaDB configuration to the correct location
COPY conf/mariadb.conf /etc/my.cnf.d/mariadb-server.cnf
# Copy the setup script into the container
COPY scripts/setup.sh /setup.sh

# Make the setup script executable
RUN chmod u+x /setup.sh
# Initialize the MariaDB database system
RUN mariadb-install-db

# Run the setup script when the container starts
ENTRYPOINT ["/setup.sh"]
