# dregsy

![Version: 0.1.4](https://img.shields.io/badge/Version-0.1.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.4.3](https://img.shields.io/badge/AppVersion-0.4.3-informational?style=flat-square)

Dregsy lets you sync Docker images between registries, public or private through defined sync tasks can be invoked as one-off or periodic task.

**Homepage:** <https://github.com/xelalexv/dregsy>

## How to install this chart

A simple install with default values:

```console
helm install oci://ghcr.io/deliveryhero/helm-charts/dregsy
```

To install a specific version of this chart:

```console
helm install oci://ghcr.io/deliveryhero/helm-charts/dregsy --version <version>
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/dregsy
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/dregsy --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/dregsy -f values.yaml
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
| dregsy.config.lister.cacheDuration | string | `"24h"` |  |
| dregsy.config.lister.maxItems | int | `100` |  |
| dregsy.config.relay | string | `"skopeo"` |  |
| dregsy.config.skopeo.binary | string | `"skopeo"` |  |
| dregsy.config.skopeo.certs-dir | string | `"/etc/skopeo/certs.d"` |  |
| dregsy.config.tasks | list | `[]` |  |
| dregsy.cron.affinity | object | `{}` |  |
| dregsy.cron.concurrencyPolicy | string | `"Forbid"` |  |
| dregsy.cron.enabled | bool | `false` |  |
| dregsy.cron.failedJobsHistoryLimit | int | `0` |  |
| dregsy.cron.restartPolicy | string | `"OnFailure"` |  |
| dregsy.cron.schedule | string | `"@daily"` |  |
| dregsy.cron.successfulJobsHistoryLimit | int | `1` |  |
| dregsy.logForceColors | bool | `false` |  |
| dregsy.logFormat | string | `"json"` |  |
| dregsy.logLevel | string | `"info"` |  |
| dregsy.logMethods | bool | `false` |  |
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
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nyambati | <no-reply@deliveryhero.com> |  |
