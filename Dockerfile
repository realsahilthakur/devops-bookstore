# Use the official PHP image as the base
FROM php:7.4-apache

# Install required extensions and tools
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    curl \
    unzip \
    git \
    && docker-php-ext-install pdo_mysql mysqli mbstring exif pcntl bcmath gd

# Set working directory
WORKDIR /var/www/html

# Copy application code
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]


##sahil doing

# # Use the official PHP image with Apache
# FROM php:7.4-apache

# # Set the working directory inside the container
# WORKDIR /var/www/html

# # Copy application code
# COPY . /var/www/html

# # Fix ownership and permissions for Apache
# RUN chown -R www-data:www-data /var/www/html \
#     && chmod -R 755 /var/www/html

# # Update Apache configuration to set login.php as the default file
# RUN echo '<IfModule dir_module>\n\
#     DirectoryIndex login.php index.php index.html\n\
# </IfModule>' > /etc/apache2/conf-enabled/app-defaults.conf

# # Disable directory indexing to prevent file listing
# RUN a2dismod -f autoindex

# # Reload Apache configuration to apply changes
# RUN service apache2 restart || true

# # Expose port 80 for HTTP traffic
# EXPOSE 80

# # Start Apache in the foreground
# CMD ["apache2-foreground"]


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
