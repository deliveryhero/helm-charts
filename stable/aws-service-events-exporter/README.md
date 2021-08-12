# aws-service-events-exporter

![Version: 1.0.4](https://img.shields.io/badge/Version-1.0.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

This helm chart exports aws service events to prometheus via aws SQS queue, this include:

- [RDS events](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html)
- [Elasticache events](https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/ECEvents.Viewing.html)

**Homepage:** <https://github.com/deliveryhero/aws-service-events-exporter>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/aws-service-events-exporter
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/aws-service-events-exporter
```

To install with some set values:

```console
helm install my-release deliveryhero/aws-service-events-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/aws-service-events-exporter -f values.yaml
```

## Source Code

* <https://github.com/deliveryhero/aws-service-events-exporter>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| env | object | `{}` | Additional environment variables |
| exporter.listenAddress | string | `"0.0.0.0"` | Exporter listening address |
| exporter.port | int | `9090` | Exporter port |
| exporter.queueUrl | string | `"change_me"` | SQS queue url |
| extraLabels | object | `{}` | Additional labels to be added to all resources |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"thomasnyambati/aws-service-events-exporter"` |  |
| image.tag | string | `"1.0.0"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations."prometheus.io/path" | string | `"/metrics"` |  |
| podAnnotations."prometheus.io/port" | string | `"9090"` |  |
| podAnnotations."prometheus.io_scrape" | string | `"true"` |  |
| podSecurityContext | object | `{}` |  |
| replicas | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.create | bool | `false` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| serviceAccountName | string | `""` | service account to be used by the containers |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nyambati | no-reply@deliveryhero.com |  |
