# Install PHP Apache
FROM php:8-apache

# Install composer
ENV COMPOSER_ALLOW_SUPERUSER=1

# Install git, unzip & zip & composer
RUN apt-get update -qq && \ 
	apt-get install -qy \
	libxml2-dev \
	libpq-dev \
	git \
	gnupg \
	unzip \
	zip

RUN	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN composer --version
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Install PHP extensions
RUN docker-php-ext-install -j$(nproc) opcache mysqli pdo_mysql pdo_pgsql pgsql session soap
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql

# Config PHP
COPY conf/php.ini /usr/local/etc/php/conf.d/app.ini

# Config Apache
COPY conf/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY conf/apache.conf /etc/apache2/conf-available/z-app.conf
RUN a2enmod rewrite remoteip && \
    a2enconf z-app

# Allow access
RUN sed -ri 's/^www-data:x:33:33:/www-data:x:1000:50:/' /etc/passwd

