FROM gcr.io/linio-support/docker-node:12-1.1.0 AS DEVELOPMENT

COPY package.json yarn.lock ./
RUN yarn install

COPY . .

FROM gcr.io/linio-support/docker-nginx:2.1.0-rc.1

COPY docker/nginx/templates/* /etc/nginx/templates/

COPY --from=DEVELOPMENT /application/public public
