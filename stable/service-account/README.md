# service-account

![Version: 1.1.1](https://img.shields.io/badge/Version-1.1.1-informational?style=flat-square)

Creates a ServiceAccount, ClusterRoleBinding and a ClusterRole with some provided rules.

This is useful when used with [IAM roles for service accounts](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html)

**Homepage:** <https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/service-account
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/service-account --version 1.1.1
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/service-account
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/service-account --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/service-account -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clusterRoleRules | list | `[]` |  |
| extraLabels | object | `{}` |  |
| serviceAccountAnnotations | object | `{}` |  |
| serviceAccountName | string | `nil` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet |  | <https://github.com/max-rocket-internet> |

## Chart source and versions

Chart source: [github.com/deliveryhero/helm-charts/service-account](https://github.com/deliveryhero/helm-charts/tree/master/stable/service-account)

Older chart versions: [github.com/deliveryhero/helm-charts/pkgs/container/helm-charts/service-account](https://github.com/deliveryhero/helm-charts/pkgs/container/helm-charts%2Fservice-account)
