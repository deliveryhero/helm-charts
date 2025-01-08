# datadog-controller

![Version: 1.2](https://img.shields.io/badge/Version-1.2-informational?style=flat-square) ![AppVersion: 0.1](https://img.shields.io/badge/AppVersion-0.1-informational?style=flat-square)

This is a simple [Kubernetes Controller](https://kubernetes.io/docs/concepts/architecture/controller/) to allow [Datadog Monitors](https://docs.datadoghq.com/monitors/) to be created, updated or deleted from custom resources in Kubernetes.

You will need to set `datadog.client_api_key` and `datadog.client_app_key` when installing the chart. These keys can be found at https://app.datadoghq.eu/account/settings#api or https://app.datadoghq.com/account/settings#api

Here's an example `DatadogMonitor` resource:

```yaml
apiVersion: datadoghq.com/v1beta1
kind: DatadogMonitor
metadata:
  name: apm-error-rate-example
spec:
  name: my-service error rate
  query: "avg(last_5m):sum:trace.http.request.errors{env:stg,service:my-service} / sum:trace.http.request.hits{env:stg,service:my-service} > 1"
  type: "query alert"
  message: Service my-service has a high error rate on env:stg
```

**Homepage:** <https://github.com/max-rocket-internet/datadog-controller>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/datadog-controller
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/datadog-controller --version 1.2
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/datadog-controller
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/datadog-controller --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/datadog-controller -f values.yaml
```

## Source Code

* <https://github.com/max-rocket-internet/datadog-controller>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| controller.environment | object | `{}` | Any extra environment variables for the controller |
| controller.leaderElection | bool | `false` | Enable leader election for running multiple controller pods |
| controller.logLevel | string | `"DEBUG"` | The log level of the controller. Can be either "DEBUG" or "INFO" |
| controller.metricAddr | string | `"0"` | Address to serve prometheus metrics on. "0" is disabled. |
| datadog.client_api_key | string | `"put_your_api_key_here"` | Your Datadog API key, you can get/create one at https://app.datadoghq.eu/account/settings#api |
| datadog.client_app_key | string | `"put_your_app_key_here"` | Your Datadog API key, you can get/create one at https://app.datadoghq.eu/account/settings#api |
| datadog.host | string | `"datadoghq.eu"` | The datadog host. Usually datadoghq.eu or datadoghq.com |
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"maxrocketinternet/datadog-controller"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"100m"` |  |
| resources.limits.memory | string | `"128Mi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| securityContext | object | `{}` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet |  | <https://github.com/max-rocket-internet> |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/datadog-controller](https://github.com/deliveryhero/helm-charts/tree/master/stable/datadog-controller)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/datadog-controller](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Fdatadog-controller)
