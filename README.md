# API Skeleton

[![Build Status](https://ci.linio.com/job/LinioIT/job/api-skeleton/job/master/badge/icon)](https://ci.linio.com/job/LinioIT/job/api-skeleton/job/master/)

API Skeleton is a PHP microservice template for Linio.

## Usage

To start working on the project:

    $ composer install
    $ yarn install
    $ cp .env.dist .env

## Running tests

To run the project tests and validate the coding standards:

    $ composer test

To run specific unit tests you can use --filter option:

    $ vendor/bin/phpunit --filter=ClassName::MethodName

## Built-in webserver

We recommend using the built-in PHP webserver to run the application
in development. We also recommend it when running the functional
test suite. You can run the webserver with:

    $ composer serve

## Built-in mock server

The application also includes a built-in mock server, built using
the OpenAPI 3.0 documentation and [Prism](https://stoplight.io/prism).

    $ yarn mock

## Documentation

This project follows the OpenAPI 3.0 standard. You can find the
specification at `docs/openapi.yaml`. Tools are included to build
the documentation:

    $ yarn build:docs
    $ firefox dist/index.html
