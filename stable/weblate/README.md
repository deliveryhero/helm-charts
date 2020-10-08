# weblate

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![AppVersion: 4.2-1](https://img.shields.io/badge/AppVersion-4.2-1-informational?style=flat-square)

Free web-based translation management system.

**Homepage:** <https://weblate.org>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/weblate
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/weblate
```

To install with some set values:

```console
helm install my-release deliveryhero/weblate --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/weblate -f values.yaml
```

## Source Code

* <https://github.com/WeblateOrg/weblate>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 9.1.4 |
| https://charts.bitnami.com/bitnami | redis | 11.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| database.create | bool | `false` |  |
| deployment.container_port | int | `8080` |  |
| deployment.environment.POSTGRES_DATABASE | string | `"weblate"` |  |
| deployment.environment.POSTGRES_HOST | string | `"database.local"` |  |
| deployment.environment.POSTGRES_PASSWORD | string | `"changeme"` |  |
| deployment.environment.POSTGRES_PORT | int | `5432` |  |
| deployment.environment.POSTGRES_USER | string | `"weblate"` |  |
| deployment.environment.REDIS_HOST | string | `"cache.local"` |  |
| deployment.environment.REDIS_PORT | int | `6379` |  |
| deployment.environment.SECURE_SSL_REDIRECT | bool | `true` |  |
| deployment.environment.WEBLATE_ADMIN_EMAIL | string | `"changeme@domain.com"` |  |
| deployment.environment.WEBLATE_ADMIN_NAME | string | `"Weblate Admin"` |  |
| deployment.environment.WEBLATE_ADMIN_PASSWORD | string | `"changeme"` |  |
| deployment.environment.WEBLATE_ALLOWED_HOSTS | string | `"weblate.domain.com"` |  |
| deployment.environment.WEBLATE_AUTHENTICATION_BACKENDS | string | `"social_core.backends.google.GoogleOAuth2,weblate.accounts.auth.WeblateUserBackend"` |  |
| deployment.environment.WEBLATE_DEBUG | bool | `false` |  |
| deployment.environment.WEBLATE_DEFAULT_FROM_EMAIL | string | `"changeme@domain.com"` |  |
| deployment.environment.WEBLATE_EMAIL_HOST | string | `"changeme.domain.com"` |  |
| deployment.environment.WEBLATE_EMAIL_HOST_PASSWORD | string | `"changeme"` |  |
| deployment.environment.WEBLATE_EMAIL_HOST_USER | string | `"changeme"` |  |
| deployment.environment.WEBLATE_EMAIL_PORT | int | `587` |  |
| deployment.environment.WEBLATE_ENABLE_HTTPS | bool | `true` |  |
| deployment.environment.WEBLATE_GOOGLE_ANALYTICS_ID | string | `"changeme"` |  |
| deployment.environment.WEBLATE_LOGLEVEL | string | `"WARNING"` |  |
| deployment.environment.WEBLATE_REGISTRATION_ALLOW_BACKENDS | string | `"social_core.backends.google.GoogleOAuth2"` |  |
| deployment.environment.WEBLATE_REGISTRATION_OPEN | int | `1` |  |
| deployment.environment.WEBLATE_SERVER_EMAIL | string | `"changeme@domain.com"` |  |
| deployment.environment.WEBLATE_SITE_DOMAIN | string | `"weblate.comain"` |  |
| deployment.environment.WEBLATE_SITE_TITLE | string | `"Weblate"` |  |
| deployment.environment.WEBLATE_SOCIAL_AUTH_GOOGLE_OAUTH2_KEY | string | `"changeme"` |  |
| deployment.environment.WEBLATE_SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET | string | `"changeme"` |  |
| deployment.environment.WEBLATE_SOCIAL_AUTH_GOOGLE_OAUTH2_WHITELISTED_DOMAINS | string | `"domain.com"` |  |
| deployment.image | string | `"weblate/weblate"` |  |
| deployment.replicas | int | `1` |  |
| deployment.resources.limits.cpu | string | `"500m"` |  |
| deployment.resources.limits.memory | string | `"4096Mi"` |  |
| deployment.resources.requests.cpu | string | `"300m"` |  |
| deployment.resources.requests.memory | string | `"2048Mi"` |  |
| deployment.strategy.rollingUpdate.maxSurge | int | `1` |  |
| deployment.strategy.rollingUpdate.maxUnavailable | int | `0` |  |
| deployment.strategy.type | string | `"RollingUpdate"` |  |
| deployment.tag | string | `"4.2-1"` |  |
| ingress.annotations."nginx.ingress.kubernetes.io/force-ssl-redirect" | string | `"true"` |  |
| ingress.annotations."nginx.ingress.kubernetes.io/proxy-body-size" | string | `"512m"` |  |
| ingress.enabled | bool | `false` |  |
| postgresql.enabled | bool | `false` |  |
| redis.enabled | bool | `false` |  |
| storage.data_path | string | `"/app/data"` |  |
| storage.enabled | bool | `false` |  |
| storage.fs_id | string | `"fs-xxxxx"` |  |
| storage.size | string | `"10Gi"` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| sietevecesmal | no-reply@deliveryhero.com |  |
