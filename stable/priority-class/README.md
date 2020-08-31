# priority-class

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

A very simple chart that creates priority classes

**Homepage:** <https://kubernetes.io/docs/concepts/configuration/pod-priority-preemption/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | no-reply@deliveryhero.com |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| PriorityClasses | list | `[{"name":"high","value":1000},{"name":"medium","value":100},{"name":"low","value":10}]` | A list of PriorityClass to create |
