# kube-downscaler

![Version: 0.7.6](https://img.shields.io/badge/Version-0.7.6-informational?style=flat-square) ![AppVersion: 23.2.0-6-gc9b88e8](https://img.shields.io/badge/AppVersion-23.2.0--6--gc9b88e8-informational?style=flat-square)

Scale down Kubernetes deployments after work hours

**Homepage:** <https://codeberg.org/hjacobs/kube-downscaler>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/kube-downscaler
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/kube-downscaler --version 0.7.6
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/kube-downscaler
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/kube-downscaler --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/kube-downscaler -f values.yaml
```

## Source Code

* <https://github.com/deliveryhero/helm-charts>
* <https://codeberg.org/hjacobs/kube-downscaler>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| debug.enable | bool | `false` |  |
| deployment.environment | object | `{}` |  |
| events.enable | bool | `true` |  |
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.args | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"hjacobs/kube-downscaler"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| interval | int | `60` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| priorityClassName | string | `""` |  |
| rbac.create | bool | `true` |  |
| rbac.extraRules | list | `[]` |  |
| rbac.serviceAccountName | string | `"default"` |  |
| replicaCount | int | `1` |  |
| resetAnnotationsCronjob.enabled | bool | `false` |  |
| resetAnnotationsCronjob.image | string | `"bitnami/kubectl:latest"` |  |
| resetAnnotationsCronjob.labelSelectors[0] | string | `"environment=staging"` |  |
| resetAnnotationsCronjob.resources.limits.cpu | string | `"50m"` |  |
| resetAnnotationsCronjob.resources.limits.memory | string | `"50Mi"` |  |
| resetAnnotationsCronjob.resources.requests.cpu | string | `"50m"` |  |
| resetAnnotationsCronjob.resources.requests.memory | string | `"50Mi"` |  |
| resetAnnotationsCronjob.schedule | string | `"0 7 * * *"` |  |
| resources.limits.cpu | string | `"50m"` |  |
| resources.limits.memory | string | `"200Mi"` |  |
| resources.requests.cpu | string | `"50m"` |  |
| resources.requests.memory | string | `"200Mi"` |  |
| securityContext | object | `{}` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| hjacobs |  | <https://codeberg.org/hjacobs> |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/kube-downscaler](https://github.com/deliveryhero/helm-charts/tree/master/stable/kube-downscaler)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/kube-downscaler](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Fkube-downscaler)
