# backstage

![Version: 0.1.6](https://img.shields.io/badge/Version-0.1.6-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.1.1-alpha.23](https://img.shields.io/badge/AppVersion-v0.1.1--alpha.23-informational?style=flat-square)

A Helm chart for Backstage

**Homepage:** <https://github.com/backstage/backstage>

## How to install this chart

Add Delivery Hero public chart repo:

```console
helm repo add deliveryhero https://charts.deliveryhero.io/
```

A simple install with default values:

```console
helm install deliveryhero/backstage
```

To install the chart with the release name `my-release`:

```console
helm install my-release deliveryhero/backstage
```

To install with some set values:

```console
helm install my-release deliveryhero/backstage --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release deliveryhero/backstage -f values.yaml
```

## Source Code

* <https://github.com/backstage/backstage>
* <https://github.com/spotify/lighthouse-audit-service>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| appConfig.app.baseUrl | string | `"https://demo.example.com"` |  |
| appConfig.app.googleAnalyticsTrackingId | string | `nil` |  |
| appConfig.app.title | string | `"Backstage"` |  |
| appConfig.auth.providers.auth0.development.clientId.$secret.env | string | `"AUTH_AUTH0_CLIENT_ID"` |  |
| appConfig.auth.providers.auth0.development.clientSecret.$secret.env | string | `"AUTH_AUTH0_CLIENT_SECRET"` |  |
| appConfig.auth.providers.auth0.development.domain.$secret.env | string | `"AUTH_AUTH0_DOMAIN"` |  |
| appConfig.auth.providers.github.development.appOrigin | string | `"http://localhost:3000/"` |  |
| appConfig.auth.providers.github.development.clientId.$secret.env | string | `"AUTH_GITHUB_CLIENT_ID"` |  |
| appConfig.auth.providers.github.development.clientSecret.$secret.env | string | `"AUTH_GITHUB_CLIENT_SECRET"` |  |
| appConfig.auth.providers.github.development.enterpriseInstanceUrl.$secret.env | string | `"AUTH_GITHUB_ENTERPRISE_INSTANCE_URL"` |  |
| appConfig.auth.providers.github.development.secure | bool | `false` |  |
| appConfig.auth.providers.gitlab.development.appOrigin | string | `"http://localhost:3000/"` |  |
| appConfig.auth.providers.gitlab.development.audience.$secret.env | string | `"GITLAB_BASE_URL"` |  |
| appConfig.auth.providers.gitlab.development.clientId.$secret.env | string | `"AUTH_GITLAB_CLIENT_ID"` |  |
| appConfig.auth.providers.gitlab.development.clientSecret.$secret.env | string | `"AUTH_GITLAB_CLIENT_SECRET"` |  |
| appConfig.auth.providers.gitlab.development.secure | bool | `false` |  |
| appConfig.auth.providers.google.development.appOrigin | string | `"http://localhost:3000/"` |  |
| appConfig.auth.providers.google.development.clientId.$secret.env | string | `"AUTH_GOOGLE_CLIENT_ID"` |  |
| appConfig.auth.providers.google.development.clientSecret.$secret.env | string | `"AUTH_GOOGLE_CLIENT_SECRET"` |  |
| appConfig.auth.providers.google.development.secure | bool | `false` |  |
| appConfig.auth.providers.microsoft.development.clientId.$secret.env | string | `"AUTH_MICROSOFT_CLIENT_ID"` |  |
| appConfig.auth.providers.microsoft.development.clientSecret.$secret.env | string | `"AUTH_MICROSOFT_CLIENT_SECRET"` |  |
| appConfig.auth.providers.microsoft.development.tenantId.$secret.env | string | `"AUTH_MICROSOFT_TENANT_ID"` |  |
| appConfig.auth.providers.oauth2.development.appOrigin | string | `"http://localhost:3000/"` |  |
| appConfig.auth.providers.oauth2.development.authorizationURL.$secret.env | string | `"AUTH_OAUTH2_AUTH_URL"` |  |
| appConfig.auth.providers.oauth2.development.clientId.$secret.env | string | `"AUTH_OAUTH2_CLIENT_ID"` |  |
| appConfig.auth.providers.oauth2.development.clientSecret.$secret.env | string | `"AUTH_OAUTH2_CLIENT_SECRET"` |  |
| appConfig.auth.providers.oauth2.development.secure | bool | `false` |  |
| appConfig.auth.providers.oauth2.development.tokenURL.$secret.env | string | `"AUTH_OAUTH2_TOKEN_URL"` |  |
| appConfig.auth.providers.okta.development.appOrigin | string | `"http://localhost:3000/"` |  |
| appConfig.auth.providers.okta.development.audience.$secret.env | string | `"AUTH_OKTA_AUDIENCE"` |  |
| appConfig.auth.providers.okta.development.clientId.$secret.env | string | `"AUTH_OKTA_CLIENT_ID"` |  |
| appConfig.auth.providers.okta.development.clientSecret.$secret.env | string | `"AUTH_OKTA_CLIENT_SECRET"` |  |
| appConfig.auth.providers.okta.development.secure | bool | `false` |  |
| appConfig.backend.baseUrl | string | `"https://demo.example.com"` |  |
| appConfig.backend.cors.origin | string | `"https://demo.example.com"` |  |
| appConfig.backend.database.client | string | `"pg"` |  |
| appConfig.backend.database.connection.database | string | `"backstage_plugin_catalog"` |  |
| appConfig.backend.database.connection.host | string | `"postgresql"` |  |
| appConfig.backend.database.connection.password | string | `"password"` |  |
| appConfig.backend.database.connection.port | int | `5432` |  |
| appConfig.backend.database.connection.ssl.ca | string | `nil` |  |
| appConfig.backend.database.connection.ssl.rejectUnauthorized | bool | `false` |  |
| appConfig.backend.database.connection.user | string | `"pgsql"` |  |
| appConfig.backend.listen.port | int | `7000` |  |
| appConfig.lighthouse.baseUrl | string | `"https://demo.example.com/lighthouse-api"` |  |
| appConfig.rollbar.organization | string | `"example-org-name"` |  |
| appConfig.sentry.organization | string | `"example-org-name"` |  |
| appConfig.techdocs.requestUrl | string | `"https://demo.example.com/api/techdocs"` |  |
| appConfig.techdocs.storageUrl | string | `"https://demo.example.com/api/techdocs/static/docs"` |  |
| auth.auth0.clientId | string | `"b"` |  |
| auth.auth0.clientSecret | string | `"b"` |  |
| auth.auth0.domain | string | `"b"` |  |
| auth.azure.api.token | string | `"h"` |  |
| auth.circleciAuthToken | string | `"r"` |  |
| auth.github.clientId | string | `"c"` |  |
| auth.github.clientSecret | string | `"c"` |  |
| auth.githubToken | string | `"g"` |  |
| auth.gitlab.baseUrl | string | `"b"` |  |
| auth.gitlab.clientId | string | `"b"` |  |
| auth.gitlab.clientSecret | string | `"b"` |  |
| auth.gitlabToken | string | `"g"` |  |
| auth.google.clientId | string | `"a"` |  |
| auth.google.clientSecret | string | `"a"` |  |
| auth.microsoft.clientId | string | `"f"` |  |
| auth.microsoft.clientSecret | string | `"f"` |  |
| auth.microsoft.tenantId | string | `"f"` |  |
| auth.newRelicRestApiKey | string | `"r"` |  |
| auth.oauth2.authUrl | string | `"b"` |  |
| auth.oauth2.clientId | string | `"b"` |  |
| auth.oauth2.clientSecret | string | `"b"` |  |
| auth.oauth2.tokenUrl | string | `"b"` |  |
| auth.okta.audience | string | `"b"` |  |
| auth.okta.clientId | string | `"b"` |  |
| auth.okta.clientSecret | string | `"b"` |  |
| auth.pagerdutyToken | string | `"h"` |  |
| auth.rollbarAccountToken | string | `"f"` |  |
| auth.sentryToken | string | `"e"` |  |
| auth.travisciAuthToken | string | `"fake-travis-ci-auth-token"` |  |
| backend.containerPort | int | `7000` |  |
| backend.demoData | bool | `true` |  |
| backend.enabled | bool | `true` |  |
| backend.image.pullPolicy | string | `"IfNotPresent"` |  |
| backend.image.repository | string | `"martinaif/backstage-k8s-demo-backend"` |  |
| backend.image.tag | string | `"test1"` |  |
| backend.nodeEnv | string | `"development"` |  |
| backend.replicaCount | int | `1` |  |
| backend.resources.limits.memory | string | `"1024Mi"` |  |
| backend.resources.requests.memory | string | `"1024Mi"` |  |
| database.create | bool | `false` |  |
| database.driver | string | `"pssql"` |  |
| database.host | string | `"backstage-db.example.com"` |  |
| database.instance_id | string | `"shared"` |  |
| database.name | string | `"backstage"` |  |
| database.port | int | `5432` |  |
| database.username | string | `"backstage"` |  |
| frontend.containerPort | int | `80` |  |
| frontend.enabled | bool | `true` |  |
| frontend.image.pullPolicy | string | `"IfNotPresent"` |  |
| frontend.image.repository | string | `"martinaif/backstage-k8s-demo-frontend"` |  |
| frontend.image.tag | string | `"test1"` |  |
| frontend.replicaCount | int | `1` |  |
| frontend.resources.limits.memory | string | `"256Mi"` |  |
| frontend.resources.requests.memory | string | `"256Mi"` |  |
| fullnameOverride | string | `""` |  |
| global.postgresql.caFilename | string | `"ca.crt"` |  |
| global.postgresql.postgresqlUsername | string | `"backend-user"` |  |
| ingress.annotations."kubernetes.io/ingress.class" | string | `"nginx"` |  |
| issuer.clusterIssuer | string | `"letsencrypt-staging"` |  |
| issuer.email | string | `nil` |  |
| lighthouse.containerPort | int | `3003` |  |
| lighthouse.database.connection.database | string | `"lighthouse_audit_service"` |  |
| lighthouse.database.connection.host | string | `"postgresql"` |  |
| lighthouse.database.connection.password | string | `"password"` |  |
| lighthouse.database.connection.port | int | `5432` |  |
| lighthouse.database.connection.user | string | `"pgsql"` |  |
| lighthouse.database.pathToDatabaseCa | string | `nil` |  |
| lighthouse.enabled | bool | `false` |  |
| lighthouse.image.pullPolicy | string | `"IfNotPresent"` |  |
| lighthouse.image.repository | string | `"roadiehq/lighthouse-audit-service"` |  |
| lighthouse.image.tag | string | `"latest"` |  |
| lighthouse.replicaCount | int | `1` |  |
| lighthouse.resources.limits.memory | string | `"256Mi"` |  |
| lighthouse.resources.requests.memory | string | `"256Mi"` |  |
| nameOverride | string | `""` |  |
| postgresql.enabled | bool | `false` |  |
| postgresql.initdbScriptsSecret | string | `"backstage-postgresql-initdb"` |  |
| postgresql.nameOverride | string | `"postgresql"` |  |
| postgresql.tls.certFilename | string | `"tls.crt"` |  |
| postgresql.tls.certKeyFilename | string | `"tls.key"` |  |
| postgresql.tls.certificatesSecret | string | `"backstage-postgresql-certs"` |  |
| postgresql.tls.enabled | bool | `true` |  |
| postgresql.volumePermissions.enabled | bool | `true` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| javad-hajiani | no-reply@deliveryhero.com |  |
| nyambati | no-reply@deliveryhero.com |  |
