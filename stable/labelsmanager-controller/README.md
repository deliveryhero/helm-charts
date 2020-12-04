# labelsmanager-controller

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

This is a simple [Kubernetes Controller](https://kubernetes.io/docs/concepts/architecture/controller/) that injects required default labels into pods on creation.

Here's an example `Labels` resource:

```yaml
apiVersion: labels.deliveryhero.com/v1beta1
kind: Labels
metadata:
    name: labels-sample
spec:
    priority: 1 # labels with highest priority takes precendence
    labels:
        country: DE
        env: stg
        region: eu

```

**Homepage:** <https://github.com/deliveryhero/labelsmanager-controller>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/labelsmanager-controller
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/labelsmanager-controller
```

To install with some set values:

```console
helm install my-release deliveryhero/labelsmanager-controller --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/labelsmanager-controller -f values.yaml
```

## Source Code

* <https://github.com/deliveryhero/labelsmanager-controller>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| controller.leaderElection | bool | `false` | Enable leader election for running multiple controller pods |
| controller.metricAddr | string | `"0"` | Address to serve prometheus metrics on. "0" is disabled. |
| controller.overwrite | bool | `false` | Overwrite any similar label on the pod. |
| controller.production | bool | `true` | The log level of the controller. enable for json logs |
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"thomasnyambati/labelsmanager-controller"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| tolerations | list | `[]` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| nyambati | thomas.nyambati@deliveryhero.com |  |
