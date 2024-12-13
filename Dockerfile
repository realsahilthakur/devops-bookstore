# Use the official PHP image with built-in PHP-FPM
FROM php:7.4-cli

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy your application code
COPY . .

# Expose port 80 for HTTP traffic
EXPOSE 80

# Run PHP's built-in server
CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]
