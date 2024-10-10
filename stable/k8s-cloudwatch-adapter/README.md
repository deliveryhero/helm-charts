# k8s-cloudwatch-adapter

![Version: 0.2.1](https://img.shields.io/badge/Version-0.2.1-informational?style=flat-square) ![AppVersion: 0.9.0](https://img.shields.io/badge/AppVersion-0.9.0-informational?style=flat-square)

An implementation of the Kubernetes Custom Metrics API and External Metrics API for AWS CloudWatch metrics. This adapter allows you to scale your Kubernetes deployment using the Horizontal Pod Autoscaler (HPA) with metrics from AWS CloudWatch.

**Homepage:** <https://github.com/awslabs/k8s-cloudwatch-adapter>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/k8s-cloudwatch-adapter
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/k8s-cloudwatch-adapter --version 0.2.1
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/k8s-cloudwatch-adapter
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/k8s-cloudwatch-adapter --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/k8s-cloudwatch-adapter -f values.yaml
```

## Source Code

* <https://github.com/awslabs/k8s-cloudwatch-adapter>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| adapter.args.cert-dir | string | `"/tmp"` |  |
| adapter.args.logtostderr | bool | `true` |  |
| adapter.args.secure-port | int | `6443` |  |
| adapter.args.v | int | `2` |  |
| affinity | object | `{}` |  |
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"chankh/k8s-cloudwatch-adapter"` |  |
| image.tag | string | `"v0.9.0"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext.fsGroup | int | `65534` |  |
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
| max-rocket-internet | <no-reply@deliveryhero.com> |  |
