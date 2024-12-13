# Use the official PHP image as the base, which includes PHP-FPM
FROM php:7.4-fpm

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /var/www/html

# Copy application code (including login.php)
COPY . .

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start PHP-FPM and Nginx
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
