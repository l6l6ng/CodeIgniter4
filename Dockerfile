FROM php:8.0.21

MAINTAINER liulong
LABEL Version="2023.08.01"
LABEL Description="PHP 8.0.21 开发环境镜像. "

ENV TZ=Asia/Shanghai

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
&& echo 'deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse' > /etc/apt/sources.list \
&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse' >> /etc/apt/sources.list \
    && apt update \
    && apt install -y tzdata vim \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
    && apt install -y --no-install-recommends  gcc make pkg-config libxml2-dev libsqlite3-dev libonig-dev libcurl4-openssl-dev libssl-dev libzip-dev \
    && apt install -y  zlib1g-dev libpng-dev \
    && apt install -y software-properties-common \
    && add-apt-repository ppa:ondrej/php -y \
    && apt update \
    && apt install -y php8.0 \
    && apt install -y php8.0-fpm \
    && apt install -y php8.0-common php8.0-mysql php8.0-xml php8.0-curl php8.0-gd php8.0-imagick php8.0-cli php8.0-dev php8.0-imap php8.0-mbstring php8.0-opcache php8.0-soap php8.0-zip php8.0-redis php8.0-mongodb php8.0-mcrypt php8.0-xmlrpc php8.0-intl php8.0-bcmath


WORKDIR /var/www
COPY . .

EXPOSE 9000

CMD [ "php", "-S", "0.0.0.0:9000", "public/index.php"]
