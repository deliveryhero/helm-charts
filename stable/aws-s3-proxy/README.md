# aws-s3-proxy

![Version: 0.1.7](https://img.shields.io/badge/Version-0.1.7-informational?style=flat-square) ![AppVersion: 2.0](https://img.shields.io/badge/AppVersion-2.0-informational?style=flat-square)

Reverse proxy for AWS S3 with basic authentication.

See here for configuration via environment variables: https://github.com/pottava/aws-s3-proxy#usage

**Homepage:** <https://github.com/pottava/aws-s3-proxy>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/aws-s3-proxy
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/aws-s3-proxy --version 0.1.7
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/aws-s3-proxy
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/aws-s3-proxy --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/aws-s3-proxy -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| deployment.env.AWS_REGION | string | `"eu-west-1"` |  |
| deployment.env.AWS_S3_BUCKET | string | `"your-s3-bucket"` |  |
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"pottava/s3-proxy"` |  |
| image.tag | string | `"2.0"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet |  | <https://github.com/max-rocket-internet> |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/aws-s3-proxy](https://github.com/deliveryhero/helm-charts/tree/master/stable/aws-s3-proxy)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/aws-s3-proxy](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Faws-s3-proxy)
