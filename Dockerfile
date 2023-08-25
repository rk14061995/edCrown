# Use an official PHP runtime as a parent image
FROM php:7.4-fpm

# Set the working directory in the container
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip

# Install PHP extensions required by Laravel
RUN docker-php-ext-install pdo pdo_mysql

# Copy the Laravel application files into the container
COPY . .

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Laravel dependencies
RUN composer install

# Expose port 9000 for the PHP-FPM server
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
