{{/*
Expand the name of the chart.
*/}}
{{- define "field-exporter.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "field-exporter.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "field-exporter.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "field-exporter.labels" -}}
helm.sh/chart: {{ include "field-exporter.chart" . }}
{{ include "field-exporter.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "field-exporter.selectorLabels" -}}
app.kubernetes.io/name: {{ include "field-exporter.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "field-exporter.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "field-exporter.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the webhook service
*/}}
{{- define "field-exporter.webhookService" -}}
{{- printf "%s-webhook-service" (include "field-exporter.fullname" .) -}}
{{- end -}}

{{/*
Create the name of the webhook cert secret
*/}}
{{- define "field-exporter.webhookCertSecret" -}}
{{- printf "%s-tls" (include "field-exporter.name" .) -}}
{{- end -}}

{{/*
Generate certificates for webhook
*/}}
{{- define "field-exporter.webhookCerts" -}}
{{- $serviceName := (include "field-exporter.webhookService" .) -}}
{{- $secretName := (include "field-exporter.webhookCertSecret" .) -}}
{{- $secret := lookup "v1" "Secret" .Release.Namespace $secretName -}}
{{- if (and .Values.webhookTLS.caCert .Values.webhookTLS.cert .Values.webhookTLS.key) -}}
caCert: {{ .Values.webhookTLS.caCert | b64enc }}
clientCert: {{ .Values.webhookTLS.cert | b64enc }}
clientKey: {{ .Values.webhookTLS.key | b64enc }}
{{- else if and .Values.keepTLSSecret $secret -}}
caCert: {{ index $secret.data "ca.crt" }}
clientCert: {{ index $secret.data "tls.crt" }}
clientKey: {{ index $secret.data "tls.key" }}
{{- else -}}
{{- $altNames := list (printf "%s.%s" $serviceName .Release.Namespace) (printf "%s.%s.svc" $serviceName .Release.Namespace) (printf "%s.%s.svc.%s" $serviceName .Release.Namespace .Values.cluster.dnsDomain) -}}
{{- $ca := genCA "field-exporter-ca" 3650 -}}
{{- $cert := genSignedCert (include "field-exporter.fullname" .) nil $altNames 3650 $ca -}}
caCert: {{ $ca.Cert | b64enc }}
clientCert: {{ $cert.Cert | b64enc }}
clientKey: {{ $cert.Key | b64enc }}
{{- end -}}
{{- end -}}
