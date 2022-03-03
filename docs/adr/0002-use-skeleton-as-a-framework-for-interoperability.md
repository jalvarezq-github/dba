# 2. Use skeleton as a framework for interoperability

Date: 2018-12-19

## Status

Accepted

## Context

We need to be able to operate within Linio's ecosystem in sync with
the existing logging, tracing and monitoring standards.

## Decision

We will use the [api-skeleton][1] and [api-bundle][2] as the base
framework for this project.

## Consequences

The api-skeleton provides a set of preset configurations for tools
that are popular within Linio: PHPUnit, Infection, PHPStan. It also
provides a PHP-CS-Fixer configuration with the official PHP coding
standards of Linio. This makes the compliance process much easier.

The api-bundle provides a base set of functionality that is required
for all API's working within Linio's ecosystem: identifying requests,
logging in [Linio Logging Standards][3] and the IETF Problem Detail
for APIs, [RFC 7807][4].

[1]: https://github.com/LinioIT/api-skeleton
[2]: https://github.com/LinioIT/api-bundle
[3]: https://github.com/LinioIT/linio-standards/blob/master/standards/logging.md
[4]: https://tools.ietf.org/html/rfc7807
