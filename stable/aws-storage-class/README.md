# aws-storage-class

![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square)

Creates a StorageClass. From here: https://github.com/kubernetes/kubernetes/blob/master/cluster/addons/storage-class/aws/default.yaml

**Homepage:** <https://github.com/deliveryhero/helm-charts>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/aws-storage-class
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/aws-storage-class
```

To install with some set values:

```console
helm install my-release deliveryhero/aws-storage-class --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/aws-storage-class -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| gp2.default | bool | `true` |  |
| gp2.volumeBindingMode | string | `"WaitForFirstConsumer"` |  |
| gp3.default | bool | `false` |  |
| gp3.volumeBindingMode | string | `"WaitForFirstConsumer"` |  |
| io1_10.default | bool | `false` |  |
| io1_10.volumeBindingMode | string | `"WaitForFirstConsumer"` |  |
| io1_20.default | bool | `false` |  |
| io1_20.volumeBindingMode | string | `"WaitForFirstConsumer"` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | <no-reply@deliveryhero.com> |  |
