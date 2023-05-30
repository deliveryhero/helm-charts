# kube-bench

![Version: 0.1.9](https://img.shields.io/badge/Version-0.1.9-informational?style=flat-square) ![AppVersion: 0.6.14](https://img.shields.io/badge/AppVersion-0.6.14-informational?style=flat-square)

Helm chart to deploy run kube-bench as a cronjob on aks, gke or eks.

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
| concurrencyPolicy | string | `"Forbid"` |  |
| cronjob.command | list | `[]` |  |
| cronjob.schedule | string | `"0 0 1 * *"` |  |
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"aquasec/kube-bench"` |  |
| image.tag | string | `"v0.6.14"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podLabels | object | `{}` |  |
| provider | string | `"eks"` |  |
| resources | object | `{}` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| tolerations | list | `[]` |  |
| volumeMounts[0].mountPath | string | `"/var/lib/kubelet"` |  |
| volumeMounts[0].name | string | `"var-lib-kubelet"` |  |
| volumeMounts[0].readOnly | bool | `true` |  |
| volumeMounts[1].mountPath | string | `"/etc/systemd"` |  |
| volumeMounts[1].name | string | `"etc-systemd"` |  |
| volumeMounts[1].readOnly | bool | `true` |  |
| volumeMounts[2].mountPath | string | `"/etc/kubernetes"` |  |
| volumeMounts[2].name | string | `"etc-kubernetes"` |  |
| volumeMounts[2].readOnly | bool | `true` |  |
| volumes[0].hostPath.path | string | `"/var/lib/kubelet"` |  |
| volumes[0].name | string | `"var-lib-kubelet"` |  |
| volumes[1].hostPath.path | string | `"/etc/systemd"` |  |
| volumes[1].name | string | `"etc-systemd"` |  |
| volumes[2].hostPath.path | string | `"/etc/kubernetes"` |  |
| volumes[2].name | string | `"etc-kubernetes"` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| goelankitt | <no-reply@deliveryhero.com> |  |
