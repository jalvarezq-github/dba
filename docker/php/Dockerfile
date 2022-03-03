FROM gcr.io/linio-support/docker-php:7.4-2.5.0 AS DEPENDENCIES

COPY composer.json composer.lock ./

ARG GITHUB_TOKEN
RUN test -n "${GITHUB_TOKEN}" && composer config -g github-oauth.github.com ${GITHUB_TOKEN} || true
RUN composer install --no-scripts -o --no-dev

FROM gcr.io/linio-support/docker-php:7.4-2.5.0 AS PRODUCTION

COPY docker/php/php.ini /usr/local/etc/php/conf.d/overrides.ini

COPY . .
COPY --from=DEPENDENCIES /application/vendor /application/vendor

RUN APP_ENV=prod bin/console cache:clear \
    && chown -R www-data:www-data var/

FROM PRODUCTION AS DEVELOPMENT

ARG GITHUB_TOKEN
RUN test -n "${GITHUB_TOKEN}" && composer config -g github-oauth.github.com ${GITHUB_TOKEN} || true
RUN composer install --no-scripts -o

FROM PRODUCTION
