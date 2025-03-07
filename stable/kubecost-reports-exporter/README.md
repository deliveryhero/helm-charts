# kubecost-reports-exporter

![Version: 2.0.5](https://img.shields.io/badge/Version-2.0.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.0.0](https://img.shields.io/badge/AppVersion-2.0.0-informational?style=flat-square)

Helm chart for exporting kubernetes cost reports to AWS s3 bucket.
N/B We have updated chart to use V2 scripts using allocations and assets api.
if you are using old installation please use v1 chart

**Homepage:** <https://www.kubecost.com>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/kubecost-reports-exporter
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/kubecost-reports-exporter --version 2.0.5
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/kubecost-reports-exporter
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/kubecost-reports-exporter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/kubecost-reports-exporter -f values.yaml
```

## Source Code

* <https://www.kubecost.com>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| activeDeadlineSeconds | int | `20` |  |
| affinity | object | `{}` |  |
| concurrencyPolicy | string | `"Forbid"` |  |
| env | object | `{}` | Extra environment variables |
| failedJobsHistoryLimit | int | `1` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"thomasnyambati/kubecost-reports-exporter"` | The container image to use |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| kubecost.allocationCostUrl | string | `"/model/allocation?window=15m&aggregate=pod&includeAggregatedMetadata=true"` | Url for allocation api cost reports |
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
| ttlSecondsAfterFinished | int | `0` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nyambati | <thomas.nyambati@deliveryhero.com> |  |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/kubecost-reports-exporter](https://github.com/deliveryhero/helm-charts/tree/master/stable/kubecost-reports-exporter)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/kubecost-reports-exporter](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Fkubecost-reports-exporter)
