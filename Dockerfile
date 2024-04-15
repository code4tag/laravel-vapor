FROM laradock/workspace:latest-8.1

LABEL repository="https://github.com/teamnovu/laravel-vapor"
LABEL homepage="https://github.com/teamnovu/laravel-vapor"
LABEL maintainer="Oliver Kaufmann <kaufmann@novu.ch>"

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH "/composer/vendor/bin:~/.local/bin:$PATH"
RUN composer self-update --2

#RUN set -xe && composer global require hirak/prestissimo
RUN set -xe && \
        composer global require laravel/vapor-cli && \
        composer clear-cache

RUN set -xe && \
        curl --silent --location https://deb.nodesource.com/setup_12.x | bash - && \
        apt-get update && \
        apt-get install -y --force-yes nodejs \
        php7.3-imagick \
        openssh-client \
        unzip && \
        apt-get autoremove && \
        apt-get autoclean && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
        npm i -g yarn
