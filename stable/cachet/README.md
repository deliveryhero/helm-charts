# cachet

![Version: 1.3.6](https://img.shields.io/badge/Version-1.3.6-informational?style=flat-square) ![AppVersion: 2.3.15](https://img.shields.io/badge/AppVersion-2.3.15-informational?style=flat-square)

The open source status page system

**Homepage:** <https://cachethq.io/>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/cachet
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/cachet --version 1.3.6
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/cachet
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/cachet --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/cachet -f values.yaml
```

## Source Code

* <https://github.com/CachetHQ/Docker>
* <https://github.com/CachetHQ/Cachet>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 11.6.26 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| database.host | string | `"cachet-db.example.com"` |  |
| database.name | string | `"cachet"` |  |
| database.password | string | `""` |  |
| database.port | int | `5432` |  |
| database.username | string | `"cachet"` |  |
| env.private.APP_KEY | string | `""` |  |
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
| ingress.ingressClassName | string | `""` | Set ingressClass for Ingress when needed |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | list | `[]` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"100m"` |  |
| resources.limits.memory | string | `"128Mi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| securityContext | list | `[]` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| test.enabled | bool | `true` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nyambati |  | <https://github.com/nyambati> |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/cachet](https://github.com/deliveryhero/helm-charts/tree/master/stable/cachet)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/cachet](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Fcachet)
