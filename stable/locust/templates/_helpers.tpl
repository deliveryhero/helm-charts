{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
*/}}
{{- define "locust.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "locust.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "locust.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "locust.master-svc" -}}
{{- printf "%s-%s" (.Release.Name | trunc 52 | trimSuffix "-") "master-svc" -}}
{{- end -}}

{{- define "locust.master" -}}
{{- printf "%s-%s" (.Release.Name | trunc 56 | trimSuffix "-") "master" -}}
{{- end -}}

{{- define "locust.worker" -}}
{{- printf "%s-%s" (.Release.Name | trunc 56 | trimSuffix "-") "worker" -}}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "locust.selectorLabels" -}}
app.kubernetes.io/name: {{ include "locust.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
load_test: {{ .Values.loadtest.name }}
{{- end }}

{{/*
Create fully qualified configmap name.
*/}}
{{- define "locust.worker-configmap" -}}
{{ if .Values.worker.config.configmapName }}
{{- printf .Values.worker.config.configmapName -}}
{{ else }}
{{- printf "%s-%s" .Release.Name "worker" -}}
{{ end }}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "locust.labels" -}}
helm.sh/chart: {{ include "locust.chart" . }}
{{ include "locust.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- range $key, $value := .Values.extraLabels }}
{{ $key }}: {{ $value | quote }}
{{- end }}
{{- end }}

{{- define "locust.locustfile_configmap_name" -}}
{{ if eq .Values.loadtest.locust_locustfile_configmap "" -}}
{{ template "locust.fullname" . }}-locustfile
{{- else -}}
{{ printf .Values.loadtest.locust_locustfile_configmap -}}
{{ end }}
{{- end -}}

{{- define "locust.lib_configmap_name" -}}
{{ if eq .Values.loadtest.locust_lib_configmap "" -}}
{{ template "locust.fullname" . }}-lib
{{- else -}}
{{- printf .Values.loadtest.locust_lib_configmap -}}
{{ end }}
{{- end -}}

{{/* Generate external secret volume */}}
{{- define "locust.external_secret.volume" -}}
- name: external-secrets
  projected:
    sources:
{{- range $key, $values := .Values.loadtest.mount_external_secret.files }}
{{- range $value := $values }}
      - secret:
          name: {{ $key }}
          items:
            - key: {{ $value }}
              path: {{ $value }}
{{- end }}
{{- end }}
{{- end -}}

{{/* Generate external secret volumemount */}}
{{- define "locust.external_secret.volumemount" -}}
- name: external-secrets
  mountPath: {{ .Values.loadtest.mount_external_secret.mountPath }}
  readOnly: true
{{- end -}}
