# aws-storage-class

![Version: 0.1.10](https://img.shields.io/badge/Version-0.1.10-informational?style=flat-square)

Creates a StorageClass. From here: https://github.com/kubernetes/kubernetes/blob/master/cluster/addons/storage-class/aws/default.yaml

**Homepage:** <https://github.com/deliveryhero/helm-charts>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/aws-storage-class
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/aws-storage-class --version 0.1.10
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/aws-storage-class
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/aws-storage-class --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/aws-storage-class -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| storage_classes.ebs_gp2.allowVolumeExpansion | bool | `true` |  |
| storage_classes.ebs_gp2.default | bool | `false` |  |
| storage_classes.ebs_gp2.provisioner | string | `"ebs.csi.aws.com"` |  |
| storage_classes.ebs_gp2.type | string | `"gp2"` |  |
| storage_classes.ebs_gp2.volumeBindingMode | string | `"WaitForFirstConsumer"` |  |
| storage_classes.ebs_gp2.volumeTags | object | `{}` | Tags to apply to created volumes, see https://github.com/kubernetes-sigs/aws-ebs-csi-driver/blob/master/docs/tagging.md |
| storage_classes.ebs_gp3.allowVolumeExpansion | bool | `true` |  |
| storage_classes.ebs_gp3.default | bool | `false` |  |
| storage_classes.ebs_gp3.provisioner | string | `"ebs.csi.aws.com"` |  |
| storage_classes.ebs_gp3.type | string | `"gp3"` |  |
| storage_classes.ebs_gp3.volumeBindingMode | string | `"WaitForFirstConsumer"` |  |
| storage_classes.ebs_gp3.volumeTags | object | `{}` | Tags to apply to created volumes, see https://github.com/kubernetes-sigs/aws-ebs-csi-driver/blob/master/docs/tagging.md |
| storage_classes.ebs_io1_10.allowVolumeExpansion | bool | `true` |  |
| storage_classes.ebs_io1_10.default | bool | `false` |  |
| storage_classes.ebs_io1_10.provisioner | string | `"ebs.csi.aws.com"` |  |
| storage_classes.ebs_io1_10.reclaimPolicy | string | `"Retain"` |  |
| storage_classes.ebs_io1_10.type | string | `"io1"` |  |
| storage_classes.ebs_io1_10.volumeBindingMode | string | `"WaitForFirstConsumer"` |  |
| storage_classes.ebs_io1_10.volumeTags | object | `{}` | Tags to apply to created volumes, see https://github.com/kubernetes-sigs/aws-ebs-csi-driver/blob/master/docs/tagging.md |
| storage_classes.ebs_io1_20.allowVolumeExpansion | bool | `true` |  |
| storage_classes.ebs_io1_20.default | bool | `false` |  |
| storage_classes.ebs_io1_20.iopsPerGB | int | `20` |  |
| storage_classes.ebs_io1_20.provisioner | string | `"ebs.csi.aws.com"` |  |
| storage_classes.ebs_io1_20.type | string | `"io1"` |  |
| storage_classes.ebs_io1_20.volumeBindingMode | string | `"WaitForFirstConsumer"` |  |
| storage_classes.ebs_io1_20.volumeTags | object | `{}` | Tags to apply to created volumes, see https://github.com/kubernetes-sigs/aws-ebs-csi-driver/blob/master/docs/tagging.md |
| storage_classes.gp2.default | bool | `false` |  |
| storage_classes.gp2.fsType | string | `"ext4"` |  |
| storage_classes.gp2.provisioner | string | `"kubernetes.io/aws-ebs"` |  |
| storage_classes.gp2.type | string | `"gp2"` |  |
| storage_classes.gp2.volumeBindingMode | string | `"WaitForFirstConsumer"` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet |  | <https://github.com/max-rocket-internet> |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/aws-storage-class](https://github.com/deliveryhero/helm-charts/tree/master/stable/aws-storage-class)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/aws-storage-class](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Faws-storage-class)
