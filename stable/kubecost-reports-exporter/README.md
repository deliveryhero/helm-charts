# kubecost-reports-exporter

![Version: 2.0.1](https://img.shields.io/badge/Version-2.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.0.0](https://img.shields.io/badge/AppVersion-2.0.0-informational?style=flat-square)

Helm chart for exporting kubernetes cost reports to AWS s3 bucket.
N/B We have updated chart to use V2 scripts using allocations and assets api.
if you are using old installation please use v1 chart

**Homepage:** <https://www.kubecost.com>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/kubecost-reports-exporter
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/kubecost-reports-exporter
```

To install with some set values:

```console
helm install my-release deliveryhero/kubecost-reports-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/kubecost-reports-exporter -f values.yaml
```

## Source Code

* <https://www.kubecost.com>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| concurrencyPolicy | string | `"Forbid"` |  |
| env | object | `{}` | Extra environment variables |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"thomasnyambati/kubecost-reports-exporter"` |  |
| imagePullSecrets | list | `[]` |  |
| kubecost.allocationCostUrl | string | `"/model/allocation?window=15m&aggregate=pod"` | Url for allocation api cost reports |
| kubecost.assetsCostUrl | string | `"/model/assets?window=15m&filterCategories=Compute&filterTypes=Node&filterServices=Kubernetes"` | Url for assets api cost reports |
| kubecost.bucketName | string | `"kubecost-reports-exporter"` | S3 Bucket name for reports export |
| kubecost.clusters[0].endpoint | string | `"http://kubecost-cost-analyzer:9090"` |  |
| kubecost.clusters[0].name | string | `"default"` |  |
| kubecost.diagnosticsUrl | string | `"/diagnostics/prometheusMetrics"` | Url for prometheus diagnostics |
| kubecost.logLevel | string | `"info"` | exporter log level. |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| resources | object | `{}` |  |
| restartPolicy | string | `"OnFailure"` |  |
| schedule | string | `"0 * * * *"` |  |
| securityContext | object | `{}` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| successfulJobsHistoryLimit | int | `1` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nyambati | <thomas.nyambati@deliveryhero.com> |  |
