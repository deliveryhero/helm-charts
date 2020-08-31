# kube-downscaler

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![AppVersion: 0.5.1](https://img.shields.io/badge/AppVersion-0.5.1-informational?style=flat-square)

Scale down Kubernetes deployments after work hours

**Homepage:** <https://github.com/hjacobs/kube-downscaler>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| hjacobs |  | https://github.com/hjacobs |

## Source Code

* <https://github.com/hjacobs/kube-downscaler>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| debug.enable | bool | `false` |  |
| deployment.environment.DEFAULT_UPTIME | string | `"Mon-Fri 07:00-20:00 Europe/Berlin"` |  |
| extraLabels | object | `{}` |  |
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
