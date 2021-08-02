# backstage-mono

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Helm chart for simple backstage deployment. This chart deploys a single pod for both backstage frontend and backend.

**Homepage:** <https://github.com/backstage/backstage>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/backstage-mono
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/backstage-mono
```

To install with some set values:

```console
helm install my-release deliveryhero/backstage-mono --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/backstage-mono -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| google.clientId | string | `"google_client_id"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"backstageimage"` |  |
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
| Ankit Goel | no-reply@deliveryhero.com |  |
