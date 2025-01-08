# backstage-mono

![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Helm chart for simple backstage deployment. This chart deploys a single pod for both backstage frontend and backend.

**Homepage:** <https://github.com/backstage/backstage>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/backstage-mono
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/backstage-mono --version 0.1.3
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/backstage-mono
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/backstage-mono --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/backstage-mono -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| extraLabels | object | `{}` | Any extra labels to apply to all resources |
| fullnameOverride | string | `""` |  |
| google.clientId | string | `"google_client_id"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"goelankit/backstage_app"` |  |
| image.tag | string | `"0.0.1"` |  |
| ingress.enabled | bool | `false` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| postgres.host | string | `"postgres_host"` |  |
| postgres.port | string | `"5432"` |  |
| postgres.user | string | `"postgres_user"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| goelankitt |  | <https://github.com/goelankitt> |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/backstage-mono](https://github.com/deliveryhero/helm-charts/tree/master/stable/backstage-mono)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/backstage-mono](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Fbackstage-mono)
