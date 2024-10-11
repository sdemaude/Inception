# Use Alpine Linux version 3.19 as the base image
FROM alpine:3.19

# Update package index and upgrade existing packages
RUN apk update && apk upgrade
# Install Nginx and OpenSSL without cache to reduce image size
RUN apk add --no-cache nginx openssl

# Create a directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl
# Generate a self-signed SSL certificate and key
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=HAVRE/O=42/OU=42/CN=sdemaude.42.fr/UID=sdemaude"

# Remove the default Nginx configuration file
RUN rm -rf /etc/nginx/http.d/default.conf
# Copy the custom Nginx configuration file into the container
COPY conf/nginx.conf /etc/nginx/http.d/inception.conf

# Expose port 443 for HTTPS traffic
EXPOSE 443

# Start Nginx in the foreground (not as a background process)
ENTRYPOINT ["nginx", "-g", "daemon off;"]
