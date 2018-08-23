FROM ubuntu:bionic
WORKDIR /app

RUN apt update
RUN apt -y install \
 software-properties-common \
 tzdata

RUN ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN add-apt-repository -y ppa:ondrej/php
RUN apt update

RUN apt -y install \
aptitude \
libgd-dev \
libcurl4-openssl-dev \
tor \
php7.2 \
php-pear \
php7.2-curl \
php7.2-dev \
php7.2-gd \
php7.2-mbstring \
php7.2-zip \
php7.2-xml \
php7.2-gnupg \
libapache2-mod-php7.2

RUN a2enmod rewrite
RUN a2enmod ssl
RUN adduser www-data root
RUN rm -rf /var/www/html
RUN ln -fs /app /var/www/html
