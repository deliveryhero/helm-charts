# aws-service-quotas-exporter

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.3.2](https://img.shields.io/badge/AppVersion-v1.3.2-informational?style=flat-square)

This exporter exports AWS service quotas and usage as Prometheus metrics

**Homepage:** <https://github.com/thought-machine/aws-service-quotas-exporter>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/aws-service-quotas-exporter
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/aws-service-quotas-exporter
```

To install with some set values:

```console
helm install my-release deliveryhero/aws-service-quotas-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/aws-service-quotas-exporter -f values.yaml
```

## Source Code

* <https://github.com/thought-machine/aws-service-quotas-exporter>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| exporter.includeAwsTags | list | `[]` | List of aws resource tags to include as labels |
| exporter.port | int | `9090` | The port the exporter metrics will be exposed on |
| exporter.region | string | `"eu-west-1"` | Aws region quotas will be fetched from |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"thoughtmachine/aws-service-quotas-exporter"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicas | int | `1` |  |
| resources.limits.cpu | string | `"10m"` |  |
| resources.limits.memory | string | `"55Mi"` |  |
| resources.requests.cpu | string | `"10m"` |  |
| resources.requests.memory | string | `"55Mi"` |  |
| securityContext | object | `{}` |  |
| service.annotations."prometheus.io/path" | string | `"/metrics"` |  |
| service.annotations."prometheus.io/port" | string | `"http"` |  |
| service.annotations."prometheus.io/scrape" | string | `"true"` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nyambati | <no-reply@deliveryhero.com> |  |
