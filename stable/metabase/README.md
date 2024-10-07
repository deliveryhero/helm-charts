# metabase

![Version: 0.14.3](https://img.shields.io/badge/Version-0.14.3-informational?style=flat-square) ![AppVersion: v0.45.2](https://img.shields.io/badge/AppVersion-v0.45.2-informational?style=flat-square)

The easy, open source way for everyone in your company to ask questions and learn from data.

**Homepage:** <http://www.metabase.com/>

## How to install this chart

A simple install with default values:

```console
helm install oci://ghcr.io/deliveryhero/helm-charts/metabase
```

To install a specific version of this chart:

```console
helm install oci://ghcr.io/deliveryhero/helm-charts/metabase --version <version>
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/metabase
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/metabase --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/metabase -f values.yaml
```

## Source Code

* <https://github.com/metabase/metabase>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| database.type | string | `"h2"` |  |
| emojiLogging | bool | `true` |  |
| extraContainers | list | `[]` |  |
| extraEnv | object | `{}` |  |
| extraLabels | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"metabase/metabase"` |  |
| image.tag | string | `"v0.45.2"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | list | `[]` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.labels | object | `{}` |  |
| ingress.path | string | `"/"` |  |
| ingress.pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| jetty | object | `{}` |  |
| listen.host | string | `"0.0.0.0"` |  |
| listen.port | int | `3000` |  |
| livenessProbe.failureThreshold | int | `6` |  |
| livenessProbe.initialDelaySeconds | int | `120` |  |
| livenessProbe.path | string | `"/api/health"` |  |
| livenessProbe.timeoutSeconds | int | `30` |  |
| monitoring.enabled | bool | `false` |  |
| monitoring.port | int | `9191` |  |
| nodeSelector | object | `{}` |  |
| password.complexity | string | `"normal"` |  |
| password.length | int | `6` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| readinessProbe.initialDelaySeconds | int | `30` |  |
| readinessProbe.path | string | `"/api/health"` |  |
| readinessProbe.periodSeconds | int | `5` |  |
| readinessProbe.timeoutSeconds | int | `3` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.externalPort | int | `80` |  |
| service.internalPort | int | `3000` |  |
| service.name | string | `"metabase"` |  |
| service.nodePort | string | `nil` |  |
| service.type | string | `"ClusterIP"` |  |
| session | object | `{}` |  |
| ssl.enabled | bool | `false` |  |
| timeZone | string | `"UTC"` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nyambati | <no-reply@deliveryhero.com> |  |
