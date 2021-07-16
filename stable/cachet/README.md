# cachet

![Version: 1.2.9](https://img.shields.io/badge/Version-1.2.9-informational?style=flat-square) ![AppVersion: 2.3.15](https://img.shields.io/badge/AppVersion-2.3.15-informational?style=flat-square)

The open source status page system

**Homepage:** <https://cachethq.io/>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/cachet
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/cachet
```

To install with some set values:

```console
helm install my-release deliveryhero/cachet --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/cachet -f values.yaml
```

## Source Code

* <https://github.com/CachetHQ/Docker>
* <https://github.com/CachetHQ/Cachet>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 9.1.4 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| database.create | bool | `false` |  |
| database.driver | string | `"pssql"` |  |
| database.host | string | `"cachet-db.example.com"` |  |
| database.instance_id | string | `"shared"` |  |
| database.name | string | `"cachet"` |  |
| database.port | int | `5432` |  |
| database.username | string | `"cachet"` |  |
| env.private.APP_KEY | string | `""` |  |
| env.private.DB_PASSWORD | string | `""` |  |
| env.private.MAIL_PASSWORD | string | `""` |  |
| env.private.MAIL_USERNAME | string | `""` |  |
| env.public.APP_DEBUG | bool | `false` |  |
| env.public.APP_LOG | string | `"errorlog"` |  |
| env.public.CACHET_BEACON | bool | `false` |  |
| env.public.CACHET_EMOJI | bool | `false` |  |
| env.public.CACHE_DRIVER | string | `"database"` |  |
| env.public.DB_DRIVER | string | `"pgsql"` |  |
| env.public.DOCKER | bool | `true` |  |
| env.public.MAIL_ADDRESS | string | `""` |  |
| env.public.MAIL_DRIVER | string | `"smtp"` |  |
| env.public.MAIL_ENCRYPTION | string | `"tls"` |  |
| env.public.MAIL_HOST | string | `""` |  |
| env.public.MAIL_NAME | string | `""` |  |
| env.public.MAIL_PORT | int | `25` |  |
| env.public.QUEUE_DRIVER | string | `"database"` |  |
| env.public.SESSION_DRIVER | string | `"database"` |  |
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"cachethq/docker"` |  |
| image.tag | string | `"2.3.15"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.host | string | `"chart-example.local"` |  |
| ingress.ingressClassName | string | `"ingressClass"` | Set ingressClass for Ingress when needed |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"100m"` |  |
| resources.limits.memory | string | `"128Mi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| test.enabled | bool | `true` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nyambati | no-reply@deliveryhero.com |  |
