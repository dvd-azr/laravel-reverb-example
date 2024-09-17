# GPT
# Use an official PHP runtime as a parent image
FROM php:8.1-fpm-alpine

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apk --no-cache add \
    bash \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    zlib-dev \
    libxml2-dev \
    oniguruma-dev \
    mysql-client \
    && docker-php-ext-configure gd --with-jpeg --with-webp \
    && docker-php-ext-install gd \
    && docker-php-ext-install mysqli pdo pdo_mysql

# Copy application code to the container
COPY . /app

# Expose port 8080
EXPOSE 8080

# Command to run the PHP-FPM server
CMD ["php-fpm"]
