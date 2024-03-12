# asqe

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.0.2](https://img.shields.io/badge/AppVersion-v1.0.2-informational?style=flat-square)

AWS Service Quotas Exporter for Prometheus. export AWS Service adjustable quotas to Prometheus.

**Homepage:** <https://github.com/deliveryhero/asqe>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/asqe
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/asqe
```

To install with some set values:

```console
helm install my-release deliveryhero/asqe --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/asqe -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args.cacheDuration | int | `300` | Exporter cache duration |
| args.configFile | string | `"/etc/asqe/config.yaml"` | Exporter scrape interval |
| args.promAddress | string | `"0.0.0.0"` | Exporter listen address |
| args.promPort | int | `9092` | Exporter listen port |
| config.jobs | list | `[]` | Exporter aws service quotas config |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` | The image pull policy |
| image.repository | string | `"asqe"` | The container image to use |
| image.tag | string | `""` | The container image tag |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicas | int | `1` |  |
| resources.limits.cpu | string | `"100m"` | cpu limits |
| resources.limits.memory | string | `"128Mi"` | memory limits |
| resources.requests.cpu | string | `"100m"` | cpu requests |
| resources.requests.memory | string | `"128Mi"` | memory requests |
| securityContext | object | `{}` |  |
| service.annotations | object | `{"prometheus.io/port":"9092","prometheus.io/scrape":"true"}` | Exporter service annotations |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nyambati | <no-reply@deliveryhero.com> |  |
