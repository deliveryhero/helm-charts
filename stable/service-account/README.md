# service-account

![Version: 1.0](https://img.shields.io/badge/Version-1.0-informational?style=flat-square)

Creates a ServiceAccount, ClusterRoleBinding and a ClusterRole with some provided rules.

This is useful when used with [IAM roles for service accounts](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html)

**Homepage:** <https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/service-account
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/service-account
```

To install with some set values:

```console
helm install my-release deliveryhero/service-account --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/service-account -f values.yaml
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
| max-rocket-internet | no-reply@deliveryhero.com |  |
