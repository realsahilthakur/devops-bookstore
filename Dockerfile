# Use the official PHP image with Apache
FROM php:7.4-apache

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy application code
COPY . /var/www/html

# Fix ownership and permissions for Apache
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Disable directory indexing to prevent exposure of files
RUN a2dismod -f autoindex

# Ensure Apache configuration allows access
RUN echo '<Directory /var/www/html>\n\
    Options Indexes FollowSymLinks\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>' > /etc/apache2/conf-available/app.conf \
    && a2enconf app

# Reload Apache modules
RUN service apache2 restart || true

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]


#-------------------------------#


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
