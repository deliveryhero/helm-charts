# node-problem-detector

![Version: 2.3.16](https://img.shields.io/badge/Version-2.3.16-informational?style=flat-square) ![AppVersion: v0.8.20](https://img.shields.io/badge/AppVersion-v0.8.20-informational?style=flat-square)

This chart installs a [node-problem-detector](https://github.com/kubernetes/node-problem-detector) daemonset. This tool aims to make various node problems visible to the upstream layers in cluster management stack. It is a daemon which runs on each node, detects node problems and reports them to apiserver.

**Homepage:** <https://github.com/kubernetes/node-problem-detector>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/node-problem-detector
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/node-problem-detector --version 2.3.16
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/node-problem-detector
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/node-problem-detector --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/node-problem-detector -f values.yaml
```

## Source Code

* <https://github.com/kubernetes/node-problem-detector>
* <https://kubernetes.io/docs/concepts/architecture/nodes/#condition>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| annotations | object | `{}` |  |
| dnsPolicy | string | `"ClusterFirst"` |  |
| env | string | `nil` |  |
| extraContainers | list | `[]` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| hostNetwork | bool | `false` | Run pod on host network Flag to run Node Problem Detector on the host's network. This is typically not recommended, but may be useful for certain use cases. |
| hostPID | bool | `false` |  |
| image.digest | string | `""` | the image digest. If given it takes precedence over a given tag. |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"registry.k8s.io/node-problem-detector/node-problem-detector"` |  |
| image.tag | string | `"v0.8.20"` |  |
| imagePullSecrets | list | `[]` |  |
| labels | object | `{}` |  |
| logDir.host | string | `"/var/log/"` | log directory on k8s host |
| logDir.pod | string | `""` | log directory in pod (volume mount), use logDir.host if empty |
| maxUnavailable | int | `1` | The max pods unavailable during an update |
| metrics.annotations | object | `{}` | Override all default annotations when `metrics.enabled=true` with specified values. |
| metrics.enabled | bool | `false` | Expose metrics in Prometheus format with default configuration. |
| metrics.prometheusRule.additionalLabels | object | `{}` |  |
| metrics.prometheusRule.additionalRules | list | `[]` |  |
| metrics.prometheusRule.defaultRules.create | bool | `true` |  |
| metrics.prometheusRule.defaultRules.disabled | list | `[]` |  |
| metrics.prometheusRule.enabled | bool | `false` |  |
| metrics.serviceMonitor.additionalLabels | object | `{}` |  |
| metrics.serviceMonitor.additionalRelabelings | list | `[]` |  |
| metrics.serviceMonitor.enabled | bool | `false` |  |
| metrics.serviceMonitor.metricRelabelings | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| priorityClassName | string | `"system-node-critical"` |  |
| rbac.create | bool | `true` |  |
| rbac.pspEnabled | bool | `false` |  |
| resources | object | `{}` |  |
| securityContext.privileged | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.labels | object | `{}` |  |
| serviceAccount.name | string | `nil` |  |
| settings.custom_monitor_definitions | object | `{}` | Custom plugin monitor config files |
| settings.custom_plugin_monitors | list | `[]` |  |
| settings.extraArgs | list | `[]` |  |
| settings.heartBeatPeriod | string | `"5m0s"` | Syncing interval with API server |
| settings.log_monitors | list | `["/config/kernel-monitor.json","/config/docker-monitor.json","/config/readonly-monitor.json"]` | User-specified custom monitor definitions |
| settings.prometheus_address | string | `"0.0.0.0"` | Prometheus exporter address |
| settings.prometheus_port | int | `20257` | Prometheus exporter port |
| tolerations[0].effect | string | `"NoSchedule"` |  |
| tolerations[0].operator | string | `"Exists"` |  |
| updateStrategy | string | `"RollingUpdate"` | Manage the daemonset update strategy |
| volume.localtime.type | string | `"FileOrCreate"` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet |  | <https://github.com/max-rocket-internet> |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/node-problem-detector](https://github.com/deliveryhero/helm-charts/tree/master/stable/node-problem-detector)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/node-problem-detector](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Fnode-problem-detector)
