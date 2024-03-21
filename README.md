# HOWTO

## Deploy

1. Clone this repo.
2. `./secrets.sh decrypt`
3. `docker compose up -d`

## Develop

1. Clone this repo.
2. `./secrets.sh decrypt`
3. Edit stuff
4. `./secrets.sh encrypt`
5. Push

## Simple caddy/authelia app

Steps to take to add a simple app, e.g. Silicon. Quite a lot to do,
unfortunately.

1. Decrypt `.env` and edit:
  * Add `FOO_FQDN`
  * Encrypt into `.env.sc`
  * Duplicate into `.env-example`
2. Edit `docker-compose.yaml`
  * Add volume
  * Add network
  * Add `FOO_FQDN` to caddy's environment
  * Add foo network to caddy's network
  * Add foo service
3. Add configuration to `Caddyfile`
