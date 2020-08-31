# service-account

![Version: 1.0](https://img.shields.io/badge/Version-1.0-informational?style=flat-square)

Creates a ServiceAccount, ClusterRoleBinding and a ClusterRole with some provided rules.

This is useful when used with [IAM roles for service accounts](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html)

**Homepage:** <https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | no-reply@deliveryhero.com |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clusterRoleRules | list | `[]` |  |
| extraLabels | object | `{}` |  |
| serviceAccountAnnotations | object | `{}` |  |
| serviceAccountName | string | `nil` |  |
