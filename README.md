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

1. Decrypt `*.env` and edit:
  * Add `FOO_FQDN` to caddy.env
  * Add `FOO_FQND` to "Environment variables" section in this file
  * Encrypt into `*.env.sc`
2. Edit `docker-compose.yaml`
  * Add volume
  * Add network
  * Add foo network to caddy's network
  * Add foo service
3. Add configuration to `Caddyfile`

# Environment variables

## tz.env

```
TZ=Your/Timezone
```

## lldap.env

```
LLDAP_JWT_SECRET=long_random_string
LLDAP_LDAP_USER_PASS=a_secure_password
LLDAP_LDAP_BASE_DN=dc=example,dc=com
```

## authelia.env

```
AUTHELIA_JWT_SECRET=long_random_string
AUTHELIA_STORAGE_ENCRYPTION_KEY=long_random_string
```

## caddy.env

```
ROOT_DN=example.com
ROOT_REDIRECT=https://blog.example.com/

AUTH_FQDN=auth.example.com
SILICON_FQDN=wiki.example.com
NEXTCLOUD_FQDN=cloud.example.com
IPV4_FQDN=ipv4.example.com
YARR_FQDN=yarr.example.com
```

## db.env

```
POSTGRES_PASSWORD=a_secure_password
```

## nextcloud.env

```
NEXTCLOUD_DBTYPE=sqlite_or_mysql_or_pgsql
NEXTCLOUD_DBHOST=db.
NEXTCLOUD_DBUSER=nextcloud
NEXTCLOUD_DBPASSWORD=a_secure_password
NEXTCLOUD_DBNAME=nextcloud
# if needed
# NEXTCLOUD_DBTABLEPREFIX=oc_
SMTP_HOST=mail.example.com
SMTP_SECURE=ssl
SMTP_PORT=465
SMTP_AUTHTYPE=LOGIN
SMTP_NAME=smtp_user
SMTP_PASSWORD=a_secure_password
MAIL_FROM_ADDRESS=noreply
MAIL_DOMAIN=cloud.example.com
```
