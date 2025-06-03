FROM php:8.3-cli-bullseye

WORKDIR /var/www/html
# Install required PHP extensions (adjust as needed)
RUN apt-get update && apt-get install -y \
    curl \
    git unzip zip \
    && docker-php-ext-install pdo pdo_mysql

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY . /var/www/html/pquery/
WORKDIR /var/www/html/pquery
RUN composer install


# Instala ocular globalmente
RUN composer global require scrutinizer/ocular
ENV PATH="/root/.composer/vendor/bin:$PATH"

