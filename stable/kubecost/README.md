# cost-analyzer

![Version: 1.86.0](https://img.shields.io/badge/Version-1.86.0-informational?style=flat-square) ![AppVersion: 1.86.0](https://img.shields.io/badge/AppVersion-1.86.0-informational?style=flat-square)

A Helm chart that sets up Kubecost, Prometheus, and Grafana to monitor cloud costs.

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/cost-analyzer
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/cost-analyzer
```

To install with some set values:

```console
helm install my-release deliveryhero/cost-analyzer --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/cost-analyzer -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| awsstore.createServiceAccount | bool | `false` |  |
| awsstore.useAwsStore | bool | `false` |  |
| clusterController.enabled | bool | `false` |  |
| clusterController.image | string | `"gcr.io/kubecost1/cluster-controller:v0.0.2"` |  |
| clusterController.imagePullPolicy | string | `"Always"` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| global.additionalLabels | object | `{}` |  |
| global.assetReports.enabled | bool | `false` |  |
| global.assetReports.reports[0].accumulate | bool | `false` |  |
| global.assetReports.reports[0].aggregateBy | string | `"type"` |  |
| global.assetReports.reports[0].filters[0].property | string | `"cluster"` |  |
| global.assetReports.reports[0].filters[0].value | string | `"cluster-one"` |  |
| global.assetReports.reports[0].title | string | `"Example Asset Report 0"` |  |
| global.assetReports.reports[0].window | string | `"today"` |  |
| global.grafana.domainName | string | `"cost-analyzer-grafana.default.svc"` |  |
| global.grafana.enabled | bool | `true` |  |
| global.grafana.proxy | bool | `true` |  |
| global.grafana.scheme | string | `"http"` |  |
| global.notifications.alertmanager.enabled | bool | `false` |  |
| global.notifications.alertmanager.fqdn | string | `"http://cost-analyzer-prometheus-server.default.svc"` |  |
| global.podAnnotations | object | `{}` |  |
| global.prometheus.enabled | bool | `true` |  |
| global.prometheus.fqdn | string | `"http://cost-analyzer-prometheus-server.default.svc"` |  |
| global.savedReports.enabled | bool | `false` |  |
| global.savedReports.reports[0].accumulate | bool | `false` |  |
| global.savedReports.reports[0].aggregateBy | string | `"namespace"` |  |
| global.savedReports.reports[0].filters[0].property | string | `"cluster"` |  |
| global.savedReports.reports[0].filters[0].value | string | `"cluster-one,cluster*"` |  |
| global.savedReports.reports[0].filters[1].property | string | `"namespace"` |  |
| global.savedReports.reports[0].filters[1].value | string | `"kubecost"` |  |
| global.savedReports.reports[0].idle | string | `"separate"` |  |
| global.savedReports.reports[0].title | string | `"Example Saved Report 0"` |  |
| global.savedReports.reports[0].window | string | `"today"` |  |
| global.savedReports.reports[1].accumulate | bool | `false` |  |
| global.savedReports.reports[1].aggregateBy | string | `"controllerKind"` |  |
| global.savedReports.reports[1].filters[0].property | string | `"label"` |  |
| global.savedReports.reports[1].filters[0].value | string | `"app:cost*,environment:kube*"` |  |
| global.savedReports.reports[1].filters[1].property | string | `"namespace"` |  |
| global.savedReports.reports[1].filters[1].value | string | `"kubecost"` |  |
| global.savedReports.reports[1].idle | string | `"share"` |  |
| global.savedReports.reports[1].title | string | `"Example Saved Report 1"` |  |
| global.savedReports.reports[1].window | string | `"month"` |  |
| global.savedReports.reports[2].accumulate | bool | `true` |  |
| global.savedReports.reports[2].aggregateBy | string | `"service"` |  |
| global.savedReports.reports[2].filters | list | `[]` |  |
| global.savedReports.reports[2].idle | string | `"hide"` |  |
| global.savedReports.reports[2].title | string | `"Example Saved Report 2"` |  |
| global.savedReports.reports[2].window | string | `"2020-11-11T00:00:00Z,2020-12-09T23:59:59Z"` |  |
| global.thanos.enabled | bool | `false` |  |
| ingress.annotations."kubernetes.io/ingress.class" | string | `"nginx"` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"cost-analyzer.local"` |  |
| ingress.paths[0] | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| initChownData.resources | object | `{}` |  |
| initChownDataImage | string | `"busybox"` |  |
| kubecost.image | string | `"gcr.io/kubecost1/server"` |  |
| kubecost.resources.requests.cpu | string | `"100m"` |  |
| kubecost.resources.requests.memory | string | `"55Mi"` |  |
| kubecostDeployment.replicas | int | `1` |  |
| kubecostFrontend.image | string | `"gcr.io/kubecost1/frontend"` |  |
| kubecostFrontend.imagePullPolicy | string | `"Always"` |  |
| kubecostFrontend.resources.requests.cpu | string | `"10m"` |  |
| kubecostFrontend.resources.requests.memory | string | `"55Mi"` |  |
| kubecostModel.etl | bool | `true` |  |
| kubecostModel.etlDailyStoreDurationDays | int | `91` |  |
| kubecostModel.etlHourlyStoreDurationHours | int | `49` |  |
| kubecostModel.image | string | `"gcr.io/kubecost1/cost-model"` |  |
| kubecostModel.imagePullPolicy | string | `"Always"` |  |
| kubecostModel.maxQueryConcurrency | int | `5` |  |
| kubecostModel.outOfClusterPromMetricsEnabled | bool | `false` |  |
| kubecostModel.resources.requests.cpu | string | `"200m"` |  |
| kubecostModel.resources.requests.memory | string | `"55Mi"` |  |
| kubecostModel.utcOffset | string | `"+00:00"` |  |
| kubecostModel.warmCache | bool | `false` |  |
| kubecostModel.warmSavingsCache | bool | `true` |  |
| kubecostToken | string | `nil` |  |
| networkCosts.additionalLabels | object | `{}` |  |
| networkCosts.affinity | object | `{}` |  |
| networkCosts.annotations | object | `{}` |  |
| networkCosts.config.destinations.cross-region | list | `[]` |  |
| networkCosts.config.destinations.direct-classification | list | `[]` |  |
| networkCosts.config.destinations.in-region | list | `[]` |  |
| networkCosts.config.destinations.in-zone[0] | string | `"127.0.0.1"` |  |
| networkCosts.config.destinations.in-zone[1] | string | `"169.254.0.0/16"` |  |
| networkCosts.config.destinations.in-zone[2] | string | `"10.0.0.0/8"` |  |
| networkCosts.config.destinations.in-zone[3] | string | `"172.16.0.0/12"` |  |
| networkCosts.config.destinations.in-zone[4] | string | `"192.168.0.0/16"` |  |
| networkCosts.enabled | bool | `false` |  |
| networkCosts.image | string | `"gcr.io/kubecost1/kubecost-network-costs:v15.6"` |  |
| networkCosts.imagePullPolicy | string | `"Always"` |  |
| networkCosts.nodeSelector | object | `{}` |  |
| networkCosts.podMonitor.additionalLabels | object | `{}` |  |
| networkCosts.podMonitor.enabled | bool | `false` |  |
| networkCosts.podSecurityPolicy.enabled | bool | `false` |  |
| networkCosts.port | int | `3001` |  |
| networkCosts.priorityClassName | list | `[]` |  |
| networkCosts.prometheusScrape | bool | `false` |  |
| networkCosts.resources | object | `{}` |  |
| networkCosts.tolerations | list | `[]` |  |
| networkCosts.trafficLogging | bool | `true` |  |
| networkPolicy.costAnalyzer.additionalLabels | object | `{}` |  |
| networkPolicy.costAnalyzer.annotations | object | `{}` |  |
| networkPolicy.costAnalyzer.enabled | bool | `false` |  |
| networkPolicy.denyEgress | bool | `true` |  |
| networkPolicy.enabled | bool | `false` |  |
| networkPolicy.sameNamespace | bool | `true` |  |
| nodeSelector | object | `{}` |  |
| persistentVolume.dbSize | string | `"32.0Gi"` |  |
| persistentVolume.enabled | bool | `true` |  |
| persistentVolume.size | string | `"32Gi"` |  |
| podSecurityPolicy.enabled | bool | `true` |  |
| pricingCsv.enabled | bool | `false` |  |
| pricingCsv.location.URI | string | `"s3://kc-csv-test/pricing_schema.csv"` |  |
| pricingCsv.location.csvAccessCredentials | string | `"pricing-schema-access-secret"` |  |
| pricingCsv.location.provider | string | `"AWS"` |  |
| pricingCsv.location.region | string | `"us-east-1"` |  |
| priority.enabled | bool | `false` |  |
| prometheusRule.additionalLabels | object | `{}` |  |
| prometheusRule.enabled | bool | `false` |  |
| remoteWrite.postgres.auth.password | string | `"admin"` |  |
| remoteWrite.postgres.enabled | bool | `false` |  |
| remoteWrite.postgres.initImage | string | `"gcr.io/kubecost1/sql-init"` |  |
| remoteWrite.postgres.initImagePullPolicy | string | `"Always"` |  |
| remoteWrite.postgres.installLocal | bool | `true` |  |
| remoteWrite.postgres.persistentVolume.size | string | `"200Gi"` |  |
| remoteWrite.postgres.remotePostgresAddress | string | `""` |  |
| reporting.errorReporting | bool | `true` |  |
| reporting.logCollection | bool | `true` |  |
| reporting.productAnalytics | bool | `true` |  |
| reporting.valuesReporting | bool | `true` |  |
| saml.appRootURL | string | `"http://localhost:9090"` |  |
| saml.enabled | bool | `false` |  |
| saml.idpMetadataURL | string | `"https://dev-elu2z98r.auth0.com/samlp/metadata/c6nY4M37rBP0qSO1IYIqBPPyIPxLS8v2"` |  |
| saml.rbac.enabled | bool | `false` |  |
| saml.rbac.groups[0].assertionName | string | `"http://schemas.auth0.com/userType"` |  |
| saml.rbac.groups[0].assertionValues[0] | string | `"admin"` |  |
| saml.rbac.groups[0].assertionValues[1] | string | `"superusers"` |  |
| saml.rbac.groups[0].enabled | bool | `false` |  |
| saml.rbac.groups[0].name | string | `"admin"` |  |
| saml.rbac.groups[1].assertionName | string | `"http://schemas.auth0.com/userType"` |  |
| saml.rbac.groups[1].assertionvalues[0] | string | `"readonly"` |  |
| saml.rbac.groups[1].enabled | bool | `false` |  |
| saml.rbac.groups[1].name | string | `"readonly"` |  |
| saml.secretName | string | `"kubecost-authzero"` |  |
| service.annotations | object | `{}` |  |
| service.labels | object | `{}` |  |
| service.port | int | `9090` |  |
| service.targetPort | int | `9090` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceMonitor.additionalLabels | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` |  |
| supportNFS | bool | `false` |  |
| systemProxy.enabled | bool | `false` |  |
| systemProxy.httpProxyUrl | string | `""` |  |
| systemProxy.httpsProxyUrl | string | `""` |  |
| systemProxy.noProxy | string | `""` |  |
| tolerations | list | `[]` |  |

