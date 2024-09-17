# kube-downscaler

![Version: 0.7.5](https://img.shields.io/badge/Version-0.7.5-informational?style=flat-square) ![AppVersion: 23.2.0-6-gc9b88e8](https://img.shields.io/badge/AppVersion-23.2.0--6--gc9b88e8-informational?style=flat-square)

Scale down Kubernetes deployments after work hours

**Homepage:** <https://codeberg.org/hjacobs/kube-downscaler>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/kube-downscaler
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/kube-downscaler
```

To install with some set values:

```console
helm install my-release deliveryhero/kube-downscaler --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/kube-downscaler -f values.yaml
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
