# kube-bench

![Version: 0.1.17](https://img.shields.io/badge/Version-0.1.17-informational?style=flat-square) ![AppVersion: 0.8.0](https://img.shields.io/badge/AppVersion-0.8.0-informational?style=flat-square)

Helm chart to deploy run kube-bench as a cronjob on aks, gke or eks.

**Homepage:** <https://github.com/aquasecurity/kube-bench>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/kube-bench
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/kube-bench --version 0.1.17
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/kube-bench
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/kube-bench --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/kube-bench -f values.yaml
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
| image.tag | string | `"v0.8.0"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podLabels | object | `{}` |  |
| provider | string | `"eks"` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
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
| goelankitt |  | <https://github.com/goelankitt> |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/kube-bench](https://github.com/deliveryhero/helm-charts/tree/master/stable/kube-bench)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/kube-bench](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Fkube-bench)
