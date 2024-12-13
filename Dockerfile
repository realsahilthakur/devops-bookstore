# Use the official PHP image with Apache
FROM php:7.4-apache

# Set working directory
WORKDIR /var/www/html

# Install required PHP extensions
RUN docker-php-ext-install pdo_mysql

# Copy application code
COPY . .

# Set appropriate permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]




# Use the official PHP image with built-in PHP-FPM
#FROM php:7.4-cli

# Set the working directory inside the container
#WORKDIR /var/www/html

# Copy your application code
#COPY . .

# Expose port 80 for HTTP traffic
#EXPOSE 80

# Run PHP's built-in server
#CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]
