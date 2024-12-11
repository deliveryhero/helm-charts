# aws-ebs-csi-driver

![Version: 2.17.2](https://img.shields.io/badge/Version-2.17.2-informational?style=flat-square) ![AppVersion: 1.16.1](https://img.shields.io/badge/AppVersion-1.16.1-informational?style=flat-square)

A Helm chart for AWS EBS CSI Driver

**Homepage:** <https://github.com/kubernetes-sigs/aws-ebs-csi-driver>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/aws-ebs-csi-driver
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/aws-ebs-csi-driver --version 2.17.2
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/aws-ebs-csi-driver
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/aws-ebs-csi-driver --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/aws-ebs-csi-driver -f values.yaml
```

## Source Code

* <https://github.com/deliveryhero/helm-charts/tree/master/stable/aws-ebs-csi-driver>
* <https://github.com/kubernetes-sigs/aws-ebs-csi-driver>

## Requirements

Kubernetes: `>=1.17.0-0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| controller.additionalArgs | list | `[]` |  |
| controller.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].key | string | `"eks.amazonaws.com/compute-type"` |  |
| controller.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].operator | string | `"NotIn"` |  |
| controller.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].values[0] | string | `"fargate"` |  |
| controller.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight | int | `1` |  |
| controller.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].key | string | `"app"` |  |
| controller.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| controller.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].values[0] | string | `"ebs-csi-controller"` |  |
| controller.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.topologyKey | string | `"kubernetes.io/hostname"` |  |
| controller.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight | int | `100` |  |
| controller.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| controller.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| controller.defaultFsType | string | `"ext4"` |  |
| controller.enableMetrics | bool | `false` | - |
| controller.env | list | `[]` |  |
| controller.envFrom | list | `[]` |  |
| controller.extraCreateMetadata | bool | `true` |  |
| controller.extraVolumeTags | object | `{}` | - extraVolumeTags:   key1: value1   key2: value2 |
| controller.httpEndpoint | string | `nil` |  |
| controller.initContainers | list | `[]` |  |
| controller.k8sTagClusterId | string | `nil` | - ID of the Kubernetes cluster used for tagging provisioned EBS volumes (optional). |
| controller.logLevel | int | `2` |  |
| controller.loggingFormat | string | `"text"` |  |
| controller.nodeSelector | object | `{}` |  |
| controller.podAnnotations | object | `{}` |  |
| controller.podLabels | object | `{}` |  |
| controller.priorityClassName | string | `"system-cluster-critical"` |  |
| controller.region | string | `nil` | - region: us-east-1 |
| controller.replicaCount | int | `2` |  |
| controller.resources | object | `{}` |  |
| controller.sdkDebugLog | bool | `false` |  |
| controller.securityContext.fsGroup | int | `1000` |  |
| controller.securityContext.runAsGroup | int | `1000` |  |
| controller.securityContext.runAsNonRoot | bool | `true` |  |
| controller.securityContext.runAsUser | int | `1000` |  |
| controller.serviceAccount.annotations | object | `{}` |  |
| controller.serviceAccount.create | bool | `true` |  |
| controller.serviceAccount.name | string | `"ebs-csi-controller-sa"` |  |
| controller.serviceMonitor.forceEnable | bool | `false` |  |
| controller.serviceMonitor.labels.release | string | `"prometheus"` |  |
| controller.tolerations[0].key | string | `"CriticalAddonsOnly"` |  |
| controller.tolerations[0].operator | string | `"Exists"` |  |
| controller.tolerations[1].effect | string | `"NoExecute"` |  |
| controller.tolerations[1].operator | string | `"Exists"` |  |
| controller.tolerations[1].tolerationSeconds | int | `300` |  |
| controller.topologySpreadConstraints | list | `[]` |  |
| controller.updateStrategy.rollingUpdate.maxUnavailable | int | `1` |  |
| controller.updateStrategy.type | string | `"RollingUpdate"` |  |
| controller.volumeMounts | list | `[]` |  |
| controller.volumes | list | `[]` |  |
| customLabels | object | `{}` | Custom labels to add into metadata |
| fullnameOverride | string | `nil` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"public.ecr.aws/ebs-csi-driver/aws-ebs-csi-driver"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `nil` |  |
| node.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].key | string | `"eks.amazonaws.com/compute-type"` |  |
| node.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].operator | string | `"NotIn"` |  |
| node.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].values[0] | string | `"fargate"` |  |
| node.containerSecurityContext.privileged | bool | `true` |  |
| node.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| node.enableWindows | bool | `false` |  |
| node.env | list | `[]` |  |
| node.envFrom | list | `[]` |  |
| node.kubeletPath | string | `"/var/lib/kubelet"` |  |
| node.logLevel | int | `2` |  |
| node.loggingFormat | string | `"text"` |  |
| node.nodeSelector | object | `{}` |  |
| node.podAnnotations | object | `{}` |  |
| node.podLabels | object | `{}` |  |
| node.priorityClassName | string | `nil` |  |
| node.resources | object | `{}` |  |
| node.securityContext.fsGroup | int | `0` |  |
| node.securityContext.runAsGroup | int | `0` |  |
| node.securityContext.runAsNonRoot | bool | `false` |  |
| node.securityContext.runAsUser | int | `0` |  |
| node.serviceAccount.annotations | object | `{}` |  |
| node.serviceAccount.create | bool | `true` |  |
| node.serviceAccount.name | string | `"ebs-csi-node-sa"` |  |
| node.tolerateAllTaints | bool | `true` |  |
| node.tolerations[0].effect | string | `"NoExecute"` |  |
| node.tolerations[0].operator | string | `"Exists"` |  |
| node.tolerations[0].tolerationSeconds | int | `300` |  |
| node.updateStrategy.rollingUpdate.maxUnavailable | string | `"10%"` |  |
| node.updateStrategy.type | string | `"RollingUpdate"` |  |
| node.volumeAttachLimit | string | `nil` |  |
| proxy.http_proxy | string | `nil` |  |
| proxy.no_proxy | string | `nil` |  |
| sidecars.attacher.env | list | `[]` |  |
| sidecars.attacher.image.pullPolicy | string | `"IfNotPresent"` |  |
| sidecars.attacher.image.repository | string | `"public.ecr.aws/eks-distro/kubernetes-csi/external-attacher"` |  |
| sidecars.attacher.image.tag | string | `"v4.1.0-eks-1-25-latest"` |  |
| sidecars.attacher.leaderElection.enabled | bool | `true` |  |
| sidecars.attacher.logLevel | int | `2` |  |
| sidecars.attacher.resources | object | `{}` |  |
| sidecars.attacher.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| sidecars.attacher.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| sidecars.livenessProbe.image.pullPolicy | string | `"IfNotPresent"` |  |
| sidecars.livenessProbe.image.repository | string | `"public.ecr.aws/eks-distro/kubernetes-csi/livenessprobe"` |  |
| sidecars.livenessProbe.image.tag | string | `"v2.9.0-eks-1-25-latest"` |  |
| sidecars.livenessProbe.resources | object | `{}` |  |
| sidecars.livenessProbe.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| sidecars.livenessProbe.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| sidecars.nodeDriverRegistrar.env | list | `[]` |  |
| sidecars.nodeDriverRegistrar.image.pullPolicy | string | `"IfNotPresent"` |  |
| sidecars.nodeDriverRegistrar.image.repository | string | `"public.ecr.aws/eks-distro/kubernetes-csi/node-driver-registrar"` |  |
| sidecars.nodeDriverRegistrar.image.tag | string | `"v2.7.0-eks-1-25-latest"` |  |
| sidecars.nodeDriverRegistrar.logLevel | int | `2` |  |
| sidecars.nodeDriverRegistrar.resources | object | `{}` |  |
| sidecars.nodeDriverRegistrar.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| sidecars.nodeDriverRegistrar.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| sidecars.provisioner.env | list | `[]` |  |
| sidecars.provisioner.image.pullPolicy | string | `"IfNotPresent"` |  |
| sidecars.provisioner.image.repository | string | `"public.ecr.aws/eks-distro/kubernetes-csi/external-provisioner"` |  |
| sidecars.provisioner.image.tag | string | `"v3.4.0-eks-1-25-latest"` |  |
| sidecars.provisioner.leaderElection.enabled | bool | `true` |  |
| sidecars.provisioner.logLevel | int | `2` |  |
| sidecars.provisioner.resources | object | `{}` |  |
| sidecars.provisioner.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| sidecars.provisioner.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| sidecars.resizer.env | list | `[]` |  |
| sidecars.resizer.image.pullPolicy | string | `"IfNotPresent"` |  |
| sidecars.resizer.image.repository | string | `"public.ecr.aws/eks-distro/kubernetes-csi/external-resizer"` |  |
| sidecars.resizer.image.tag | string | `"v1.7.0-eks-1-25-latest"` |  |
| sidecars.resizer.logLevel | int | `2` |  |
| sidecars.resizer.resources | object | `{}` |  |
| sidecars.resizer.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| sidecars.resizer.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| sidecars.snapshotter.env | list | `[]` |  |
| sidecars.snapshotter.forceEnable | bool | `false` |  |
| sidecars.snapshotter.image.pullPolicy | string | `"IfNotPresent"` |  |
| sidecars.snapshotter.image.repository | string | `"public.ecr.aws/eks-distro/kubernetes-csi/external-snapshotter/csi-snapshotter"` |  |
| sidecars.snapshotter.image.tag | string | `"v6.2.1-eks-1-25-latest"` |  |
| sidecars.snapshotter.logLevel | int | `2` |  |
| sidecars.snapshotter.resources | object | `{}` |  |
| sidecars.snapshotter.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| sidecars.snapshotter.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| storageClasses | list | `[]` |  |
| useOldCSIDriver | bool | `false` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Kubernetes Authors |  | <https://github.com/kubernetes-sigs/aws-ebs-csi-driver/> |
