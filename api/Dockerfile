FROM php:7.4-apache

# Copiar el fichero de configuración Virtual Server del servidor apache
COPY apache.conf /etc/apache2/sites-available/000-default.conf

# Habilitar el sitio de Apache
RUN a2ensite 000-default

# Copiamos los ficheros necesarios del proyecto
COPY . /var/www/
RUN chown -R www-data:www-data /var/www

EXPOSE 80

CMD ["apache2-foreground"]