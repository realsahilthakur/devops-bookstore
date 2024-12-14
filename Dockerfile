# Step 1: Use a base image with PHP and Apache
FROM php:8.2-apache

# Step 2: Enable required Apache modules
RUN a2enmod rewrite

# Step 3: Copy your PHP application code to the container
COPY . /var/www/html

# Step 4: Set the working directory
WORKDIR /var/www/html

# Step 5: Install additional PHP extensions if needed
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Step 6: Expose the HTTP port
EXPOSE 80

# Step 7: Set the default command (Apache in foreground mode)
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
