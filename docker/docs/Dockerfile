FROM gcr.io/linio-support/docker-node:12-1.1.0 AS BUILD

COPY package.json yarn.lock ./
RUN yarn install

COPY docs docs

RUN yarn build:docs

FROM gcr.io/linio-support/docker-nginx:2.0.4

COPY docker/docs/conf.d /etc/nginx/conf.d

COPY --from=BUILD /application/dist public
