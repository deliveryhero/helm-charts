# locust

![Version: 0.33.0](https://img.shields.io/badge/Version-0.33.0-informational?style=flat-square) ![AppVersion: 2.32.2](https://img.shields.io/badge/AppVersion-2.32.2-informational?style=flat-square)

A chart to install Locust, a scalable load testing tool written in Python.

This chart will setup everything required to run a full distributed locust environment with any amount of workers.

Locust requires locust files to execute load testing, and this chart provides different ways to populate locust files.

## Kubernetes ConfigMap

This chart can create configmaps for storing the locust files in Kubernetes, this way there is no need to build custom docker images.

By default it will install using an example locustfile and lib from [stable/locust/locustfiles/example](https://github.com/deliveryhero/helm-charts/tree/master/stable/locust/locustfiles/example). When you want to provide your own locustfile, you will need to create 2 configmaps using the structure from that example:

```console
kubectl create configmap my-loadtest-locustfile --from-file path/to/your/main.py
kubectl create configmap my-loadtest-lib --from-file path/to/your/lib/
```

And then install the chart passing the names of those configmaps as values:

```console
helm install locust oci://ghcr.io/deliveryhero/helm-charts/locust \
  --set loadtest.name=my-loadtest \
  --set loadtest.locust_locustfile_configmap=my-loadtest-locustfile \
  --set loadtest.locust_lib_configmap=my-loadtest-lib
```

## Git Sync

Another way to fetch locust files in the pods is to continously track a git repository containing the files.

While activating this feature, you also have to disable the default ConfigMap-based provisioning, through a custom `values.yaml` file:

```yaml
loadtest:
  enabled = false
locustfiles:
  gitSync:
    enabled = true
```

Then configure the gitSync process to fetch the right repository and the right files:

```yaml
locustfiles:
  gitSync:
    repo: https://github.com/username/reponame.git
```

**Homepage:** <https://github.com/locustio/locust>

## How to install this chart

A simple install with default values, latest chart version and generated name:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/locust
```

To install a specific version of this chart:

```console
helm install --generate-name oci://ghcr.io/deliveryhero/helm-charts/locust --version 0.33.0
```

To install the chart with the release name `my-release`:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/locust
```

To install with some set values:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/locust --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release oci://ghcr.io/deliveryhero/helm-charts/locust -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| extraConfigMaps | object | `{}` | Any extra configmaps to mount for the master and worker. Can be used for extra python packages |
| extraLabels | object | `{}` | Any extra labels to apply to all resources |
| extraObjects | list | `[]` | Any extra manifests to deploy alongside locust. Can be used for external secret providers |
| fullnameOverride | string | `""` |  |
| hostAliases | list | `[]` | List of entries added to the /etc/hosts file on the pod to resolve custom hosts |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"locustio/locust"` |  |
| image.tag | string | `"2.32.2"` |  |
| imagePullSecrets | list | `[]` |  |
| images.defaultLocustRepository | string | `"locustio/locust"` | default image used by locust containers (master and workers) |
| images.defaultLocustTag | string | `"2.32.2"` | default tag used by locust containers (master and workers) |
| images.gitSync.pullPolicy | string | `"IfNotPresent"` |  |
| images.gitSync.repository | string | `"registry.k8s.io/git-sync/git-sync"` | image used by gitSync container |
| images.gitSync.tag | string | `"v4.1.0"` | tag used by gitSync container |
| images.master.pullPolicy | string | `"IfNotPresent"` |  |
| images.master.repository | string | `nil` | image used by locust master container |
| images.master.tag | string | `nil` | tag used by locust master container |
| images.worker.pullPolicy | string | `"IfNotPresent"` |  |
| images.worker.repository | string | `nil` | image used by locust worker containers |
| images.worker.tag | string | `nil` | tag used by locust worker containers |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].path | string | `"/"` |  |
| ingress.hosts[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| loadtest.enabled | bool | `true` |  |
| loadtest.environment | object | `{}` | environment variables used in the load test for both master and workers |
| loadtest.environment_external_secret | object | `{}` | environment variables used in the load test for both master and workers, stored in secrets created outside this chart. Each secret contains a list of values in it. Usage: `secret_name: [AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY]` |
| loadtest.environment_secret | object | `{}` | environment variables used in the load test for both master and workers, stored as secrets |
| loadtest.excludeTags | string | `""` | whether to run locust with `--exclude-tags [TAG [TAG ...]]` options, so only tasks with no matching tags will be executed |
| loadtest.headless | bool | `false` | whether to run locust with headless settings |
| loadtest.locustCmd | string | `"/opt/venv/bin/locust"` | The command to run Locust |
| loadtest.locust_host | string | `"https://www.google.com"` | the host you will load test |
| loadtest.locust_lib_configmap | string | `"example-lib"` | name of a configmap containing your lib (default uses the example lib) |
| loadtest.locust_locustfile | string | `"main.py"` | the name of the locustfile |
| loadtest.locust_locustfile_configmap | string | `"example-locustfile"` | name of a configmap containing your locustfile (default uses the example locustfile) |
| loadtest.locust_locustfile_path | string | `"/mnt/locust"` | the path of the locustfile (without trailing backslash) |
| loadtest.mount_external_secret | object | `{}` | additional mount used in the load test for both master and workers, stored in secrets created outside this chart. Each secret contains a list of values in it. Usage: `mountPath: yourMountLocation, files: { secret_name: [AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY] }` |
| loadtest.name | string | `"example"` | a name used for resources and settings in this load test |
| loadtest.pip_packages | list | `[]` | a list of extra python pip packages to install |
| loadtest.tags | string | `""` | whether to run locust with `--tags [TAG [TAG ...]]` options, so only tasks with any matching tags will be executed |
| locustfiles.gitSync.containerLifecycleHooks | object | `{}` |  |
| locustfiles.gitSync.containerName | string | `"git-sync"` |  |
| locustfiles.gitSync.depth | int | `1` |  |
| locustfiles.gitSync.enabled | bool | `false` | Enable the Git Sync feature (mutually exclusive with loadtest.enabled) |
| locustfiles.gitSync.env | list | `[]` |  |
| locustfiles.gitSync.envFrom | string | `nil` | add variables from secret into gitSync containers, such proxy-config |
| locustfiles.gitSync.extraVolumeMounts | list | `[]` |  |
| locustfiles.gitSync.maxFailures | int | `0` | the number of consecutive failures allowed before aborting |
| locustfiles.gitSync.period | string | `"5s"` |  |
| locustfiles.gitSync.ref | string | `"main"` | Git reference to pull |
| locustfiles.gitSync.repo | string | `nil` | Git repository to synchronize |
| locustfiles.gitSync.resources | object | `{}` |  |
| locustfiles.gitSync.securityContext | object | `{}` |  |
| locustfiles.gitSync.securityContexts.container | object | `{}` |  |
| locustfiles.gitSync.subPath | string | `"locustfiles"` | subpath within the repo where locustfiles are located, should be "" if files are at repo root |
| locustfiles.gitSync.uid | int | `65533` |  |
| locustfiles.mountPath | string | `"/mnt/locust"` | the path of the locustfiles (without trailing backslash) |
| locustfiles.requirements | string | `nil` | Path to a file containing requirements to install |
| master.affinity | object | `{}` | Overwrites affinity from global |
| master.args | list | `[]` | Any extra command args for the master |
| master.auth.enabled | bool | `false` | When enabled using image tag 2.21.0 or later you do not need username or pass word. Older image tags you are required to |
| master.auth.password | string | `""` |  |
| master.auth.username | string | `""` |  |
| master.command[0] | string | `"sh"` |  |
| master.command[1] | string | `"/config/docker-entrypoint.sh"` |  |
| master.deploymentAnnotations | object | `{}` | Annotations on the deployment for master |
| master.environment | object | `{}` | environment variables for the master |
| master.envs_include_default | bool | `true` | Whether to include default environment variables |
| master.extraPorts | string | `nil` |  |
| master.image | string | `""` | A custom docker image including tag |
| master.livenessProbe | object | `{}` |  |
| master.logLevel | string | `"INFO"` | Log level. Can be INFO or DEBUG |
| master.nodeSelector | object | `{}` | Overwrites nodeSelector from global |
| master.pdb.enabled | bool | `false` | Whether to create a PodDisruptionBudget for the master pod |
| master.readinessProbe.failureThreshold | int | `2` |  |
| master.readinessProbe.httpGet.path | string | `"/"` |  |
| master.readinessProbe.httpGet.port | int | `8089` |  |
| master.readinessProbe.httpGet.scheme | string | `"HTTP"` |  |
| master.readinessProbe.initialDelaySeconds | int | `5` |  |
| master.readinessProbe.periodSeconds | int | `30` |  |
| master.readinessProbe.successThreshold | int | `1` |  |
| master.readinessProbe.timeoutSeconds | int | `30` |  |
| master.replicas | int | `1` | Should be set to either 0 or 1. |
| master.resources | object | `{}` | resources for the locust master |
| master.restartPolicy | string | `"Always"` | master pod's restartPolicy. Can be Always, OnFailure, or Never. |
| master.serviceAccountAnnotations | object | `{}` |  |
| master.startupProbe | object | `{}` |  |
| master.strategy.type | string | `"RollingUpdate"` |  |
| master.tolerations | list | `[]` | Overwrites tolerations from global |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.extraLabels | object | `{}` |  |
| service.loadBalancerIP | string | `""` |  |
| service.port | int | `8089` |  |
| service.targetPort | int | `8089` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |
| worker.affinity | object | `{}` | Overwrites affinity from global |
| worker.args | list | `[]` | Any extra command args for the workers |
| worker.command[0] | string | `"sh"` |  |
| worker.command[1] | string | `"/config/docker-entrypoint.sh"` |  |
| worker.deploymentAnnotations | object | `{}` | Annotations on the deployment for workers |
| worker.environment | object | `{}` | environment variables for the workers |
| worker.envs_include_default | bool | `true` | Whether to include default environment variables |
| worker.hpa.enabled | bool | `false` |  |
| worker.hpa.maxReplicas | int | `100` |  |
| worker.hpa.minReplicas | int | `1` |  |
| worker.hpa.targetCPUUtilizationPercentage | int | `40` |  |
| worker.image | string | `""` | A custom docker image including tag |
| worker.keda.cooldownPeriod | int | `30` |  |
| worker.keda.enabled | bool | `false` |  |
| worker.keda.pollingInterval | int | `15` |  |
| worker.keda.triggers | string | `"# https://keda.sh/docs/latest/scalers/metrics-api/\n- type: metrics-api\n  metadata:\n    activationTargetValue: \"0\"\n    targetValue: \"50\"   # Scale pods based on target users\n    url: \"http://{{ template \"locust.fullname\" . }}.{{ .Release.Namespace }}.svc.cluster.local:{{ $.Values.service.port }}/stats/requests\"\n    format: json\n    valueLocation: 'user_count'\n"` |  |
| worker.logLevel | string | `"INFO"` | Log level. Can be INFO or DEBUG |
| worker.nodeSelector | object | `{}` | Overwrites nodeSelector from global |
| worker.pdb.enabled | bool | `false` | Whether to create a PodDisruptionBudget for the worker pods |
| worker.replicas | int | `1` |  |
| worker.resources | object | `{}` | resources for the locust worker |
| worker.restartPolicy | string | `"Always"` | worker pod's restartPolicy. Can be Always, OnFailure, or Never. |
| worker.serviceAccountAnnotations | object | `{}` |  |
| worker.strategy.type | string | `"RollingUpdate"` |  |
| worker.tolerations | list | `[]` | Overwrites tolerations from global |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | <no-reply@deliveryhero.com> |  |
