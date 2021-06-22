# weblate

![Version: 0.2.3](https://img.shields.io/badge/Version-0.2.3-informational?style=flat-square) ![AppVersion: 4.2-1](https://img.shields.io/badge/AppVersion-4.2--1-informational?style=flat-square)

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
| adminEmail | string | `""` | Email of Admin Account |
| adminPassword | string | `""` | Password of Admin Account |
| adminUser | string | `""` | Name of Admin Account |
| affinity | object | `{}` |  |
| allowedHosts | string | `"*"` | Hosts that are allowed to connect |
| configOverride | string | `""` | Config override. See https://docs.weblate.org/en/latest/admin/install/docker.html#custom-configuration-files |
| database.create | bool | `false` |  |
| debug | string | `"0"` | Enable debugging |
| defaultFromEmail | string | `""` | From email for outgoing emails |
| emailHost | string | `""` | Host for sending emails |
| emailPassword | string | `""` | Password for sending emails |
| emailPort | int | `587` | Port for sending emails |
| emailSSL | bool | `true` | Use SSL when sending emails |
| emailTLS | bool | `true` | Use TLS when sending emails |
| emailUser | string | `""` | User name for sending emails |
| extraConfig | object | `{}` | Additional (environment) configs. See https://docs.weblate.org/en/latest/admin/install/docker.html#docker-environment |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"weblate/weblate"` |  |
| image.tag | string | `"4.2.2-1"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteMany"` |  |
| persistence.efs.enabled | bool | `false` |  |
| persistence.efs.fs_id | string | `nil` |  |
| persistence.enabled | bool | `false` |  |
| persistence.filestore_dir | string | `"/app/data"` |  |
| persistence.size | string | `"10Gi"` |  |
| persistence.storageClass | string | `"-"` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.postgresqlDatabase | string | `"weblate"` |  |
| postgresql.postgresqlHost | string | `None` | External postgres database endpoint, to be used if `postgresql.enabled == false` |
| postgresql.postgresqlPassword | string | `"weblate"` |  |
| postgresql.postgresqlUsername | string | `"weblate"` |  |
| postgresql.service.port | int | `5432` |  |
| redis.cluster.enabled | bool | `false` |  |
| redis.db | int | `1` |  |
| redis.enabled | bool | `true` |  |
| redis.password | string | `"weblate"` |  |
| redis.redisHost | string | `None` | External redis database endpoint, to be used if `redis.enabled == false` |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| serverEmail | string | `""` | Sender for outgoing emails |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| siteDomain | string | `"chart-example.local"` | Site domain |
| siteTitle | string | `"Weblate"` |  |
| tolerations | list | `[]` |  |
| updateStrategy | string | `"Recreate"` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| sietevecesmal | no-reply@deliveryhero.com |  |
