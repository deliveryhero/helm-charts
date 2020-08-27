# kube-downscaler

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![AppVersion: 0.5.1](https://img.shields.io/badge/AppVersion-0.5.1-informational?style=flat-square)

Scale down Kubernetes deployments after work hours

**Homepage:** <https://github.com/hjacobs/kube-downscaler>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/public
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

* <https://github.com/hjacobs/kube-downscaler>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| debug.enable | bool | `false` |  |
| deployment.environment.DEFAULT_UPTIME | string | `"Mon-Fri 07:00-20:00 Europe/Berlin"` |  |
| extraLabels.dh_app | string | `"kube-downscaler"` |  |
| extraLabels.dh_env | string | `"stg"` |  |
| extraLabels.dh_region | string | `"eu01"` |  |
| extraLabels.dh_squad | string | `"infra"` |  |
| extraLabels.dh_tribe | string | `"vendor"` |  |
| image.args | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"hjacobs/kube-downscaler"` |  |
| image.tag | string | `"19.10.1"` |  |
| interval | int | `60` |  |
| name | string | `"kube-downscaler"` |  |
| rbac.create | bool | `true` |  |
| rbac.serviceAccountName | string | `"default"` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"50m"` |  |
| resources.limits.memory | string | `"200Mi"` |  |
| resources.requests.cpu | string | `"50m"` |  |
| resources.requests.memory | string | `"200Mi"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Henning Jacobs |  | https://github.com/hjacobs |
