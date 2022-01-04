# kube-bench

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square)

Helm chart to deploy run kube-bench as a cronjob on gke or eks.

**Homepage:** <https://github.com/aquasecurity/kube-bench>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/kube-bench
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/kube-bench
```

To install with some set values:

```console
helm install my-release deliveryhero/kube-bench --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/kube-bench -f values.yaml
```

## Source Code

* <https://github.com/aquasecurity/kube-bench>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| cronjob.schedule | string | `"0 0 1 * *"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"aquasec/kube-bench"` |  |
| image.tag | string | `"0.4.0"` |  |
| nodeSelector | object | `{}` |  |
| provider | string | `"eks"` |  |
| resources | object | `{}` |  |
| tolerations | list | `[]` |  |
| concurrencyPolicy | string | `"Forbid"` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| goelankitt | no-reply@deliveryhero.com |  |
