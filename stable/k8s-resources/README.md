# k8s-resources

![Version: 0.7.0](https://img.shields.io/badge/Version-0.7.0-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

Not an application but a Helm chart to create any and many resources in Kubernetes.

Currently supports:

- CronJob
- ConfigMap
- Custom resources from CustomResourceDefinition
- HorizontalPodAutoscaler
- Ingress
- Namespace
- Secret
- Service
- ServiceAccount
- ScaledObject (KEDA)
- ClusterRole
- ClusterRoleBinding

Every resource type can have custom labels, annotations or a `fullnameOverride` set. See default [values.yaml](https://github.com/deliveryhero/helm-charts/blob/master/stable/k8s-resources/values.yaml) for examples.

**Homepage:** <https://github.com/deliveryhero/helm-charts>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/k8s-resources
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/k8s-resources --version 0.7.0
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/k8s-resources
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/k8s-resources --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/k8s-resources -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| ClusterRoleBindings | list | `[]` | A list ClusterRoleBindings to create |
| ClusterRoles | list | `[]` | A list ClusterRoles to create |
| ConfigMaps | list | `[]` | A list ConfigMap to create |
| CronJobs | list | `[]` | A list CronJobs to create |
| CustomResources | list | `[]` | A list resources to create that are completely custom |
| HorizontalPodAutoscalers | list | `[]` | A list HorizontalPodAutoscaler to create |
| Ingresses | list | `[]` | A list Ingress to create |
| Namespaces | list | `[]` | A list Namespaces to create |
| PriorityClasses | list | `[]` | A list PriorityClasses to create |
| ScaledObjects | list | `[]` | A list ScaledObjects to create |
| Secrets | list | `[]` | A list Secret to create |
| ServiceAccounts | list | `[]` | A list ServiceAccount to create |
| Services | list | `[]` | A list Service to create |
| fullnameOverride | string | `""` | Override the full name of resources |
| nameOverride | string | `""` | Override the name of resources |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | <no-reply@deliveryhero.com> |  |
