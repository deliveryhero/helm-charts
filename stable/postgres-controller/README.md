# postgres-controller

![Version: 1.3](https://img.shields.io/badge/Version-1.3-informational?style=flat-square) ![AppVersion: 0.5](https://img.shields.io/badge/AppVersion-0.5-informational?style=flat-square)

A controller for managing PostgreSQL databases, roles and more

**Homepage:** <https://github.com/max-rocket-internet/postgres-controller>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/postgres-controller
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/postgres-controller
```

To install with some set values:

```console
helm install my-release deliveryhero/postgres-controller --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/postgres-controller -f values.yaml
```

## Source Code

* <https://github.com/max-rocket-internet/postgres-controller>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| config.postgres_instances.default.host | string | `"hostname"` |  |
| config.postgres_instances.default.password | string | `"postgres"` |  |
| config.postgres_instances.default.port | int | `5432` |  |
| config.postgres_instances.default.user | string | `"postgres"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"maxrocketinternet/postgres-controller"` |  |
| image.tag | float | `0.5` |  |
| log_level | string | `"info"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| rbac.create | bool | `true` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | <no-reply@deliveryhero.com> |  |
