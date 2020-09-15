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

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| database.create | bool | `true` |  |
| deployment.container_port | int | `8080` |  |
| deployment.environment.SECURE_SSL_REDIRECT | bool | `true` |  |
| deployment.environment.WEBLATE_ADMIN_NAME | string | `"Weblate Admin"` |  |
| deployment.environment.WEBLATE_DEBUG | bool | `false` |  |
| deployment.environment.WEBLATE_ENABLE_HTTPS | bool | `true` |  |
| deployment.environment.WEBLATE_LOGLEVEL | string | `"WARNING"` |  |
| deployment.environment.WEBLATE_SITE_TITLE | string | `"Weblate"` |  |
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
| storage.data_path | string | `"/app/data"` |  |
| storage.enabled | bool | `false` |  |
| storage.fs_id | string | `"fs-xxxxx"` |  |
| storage.size | string | `"10Gi"` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| sietevecesmal | no-reply@deliveryhero.com |  |
