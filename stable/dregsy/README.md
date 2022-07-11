# dregsy

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.4.3](https://img.shields.io/badge/AppVersion-0.4.3-informational?style=flat-square)

Dregsy lets you sync Docker images between registries, public or private through defined sync tasks can be invoked as one-off or periodic task.

**Homepage:** <https://github.com/xelalexv/dregsy>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/dregsy
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/dregsy
```

To install with some set values:

```console
helm install my-release deliveryhero/dregsy --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/dregsy -f values.yaml
```

## Source Code

* <https://github.com/xelalexv/dregsy>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `10` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| config.lister.cacheDuration | string | `"24h"` |  |
| config.lister.maxItems | int | `100` |  |
| config.relay | string | `"skopeo"` |  |
| config.skopeo.binary | string | `"skopeo"` |  |
| config.skopeo.certs-dir | string | `"/etc/skopeo/certs.d"` |  |
| config.tasks | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"xelalex/dregsy"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLables | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| resources.limits.cpu | string | `"10m"` |  |
| resources.limits.memory | string | `"32Mi"` |  |
| resources.requests.cpu | string | `"10m"` |  |
| resources.requests.memory | string | `"32Mi"` |  |
| securityContext | object | `{}` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nyambati | no-reply@deliveryhero.com |  |
