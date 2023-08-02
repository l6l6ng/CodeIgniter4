FROM psylife/psy-php8.0

WORKDIR /var/www
COPY . .

EXPOSE 9000

CMD [ "php", "-S", "0.0.0.0:9000", "public/index.php"]
