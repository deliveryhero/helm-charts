# aws-events-exporter

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

This helm chart exports aws events to prometheus via aws SQS service

**Homepage:** <https://github.com/deliveryhero/aws-events-exporter>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/aws-events-exporter
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/aws-events-exporter
```

To install with some set values:

```console
helm install my-release deliveryhero/aws-events-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/aws-events-exporter -f values.yaml
```

## Source Code

* <https://github.com/deliveryhero/aws-events-exporter>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| env | object | `{}` | Additional environment variables |
| exporter.listenAddress | string | `"0.0.0.0"` | Exporter listening address |
| exporter.port | int | `9090` | Exporter port |
| exporter.queueUrl | string | `""` | SQS queue url |
| extraLabels | object | `{}` | Additional labels to be added to all resources |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"thomasnyambati/aws-events-exporter"` |  |
| image.tag | string | `"1.0.0"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicas | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccountName | string | `""` | service account to be used by the containers |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nyambati | no-reply@deliveryhero.com |  |
