# priority-class

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

A very simple chart that creates priority classes

**Homepage:** <https://kubernetes.io/docs/concepts/configuration/pod-priority-preemption/>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/priority-class
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/priority-class --version 0.2.0
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/priority-class
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/priority-class --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/priority-class -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| PriorityClasses | list | `[{"description":"This priority class will not cause other pods to be preempted.","globalDefault":false,"name":"high-priority-nonpreempting","preemptionPolicy":"Never","value":10000},{"name":"high","value":1000},{"name":"medium","value":100},{"name":"low","value":10}]` | A list of PriorityClass to create |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet |  | <https://github.com/max-rocket-internet> |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/priority-class](https://github.com/deliveryhero/helm-charts/tree/master/stable/priority-class)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/priority-class](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Fpriority-class)
