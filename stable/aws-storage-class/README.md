# storage-class

![Version: 0.1](https://img.shields.io/badge/Version-0.1-informational?style=flat-square)

Creates a StorageClass. From here: https://github.com/kubernetes/kubernetes/blob/master/cluster/addons/storage-class/aws/default.yaml

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/public
```

A simple install with default values:

```console
helm install deliveryhero/storage-class
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/storage-class
```

To install with some set values:

```console
helm install my-release deliveryhero/storage-class --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/storage-class -f values.yaml
```

