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

{{- define "locust.master-svc" -}}
{{- printf "%s-%s" .Release.Name "master-svc" | trunc 63 -}}
{{- end -}}

{{- define "locust.master" -}}
{{- printf "%s-%s" .Release.Name "master" | trunc 63 -}}
{{- end -}}

{{- define "locust.worker" -}}
{{- printf "%s-%s" .Release.Name "worker" | trunc 63 -}}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "locust.selectorLabels" -}}
app.kubernetes.io/name: {{ include "locust.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
loadtest: {{ .Values.loadtest.name }}
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

{{- define "locust.loadtests" -}}
{{- $processedDict := dict -}}
{{- range $path, $bytes := .Files.Glob "locustfiles/**" }}
{{- $name := base (dir $path) }}
{{- if not (hasKey $processedDict $name) -}}
{{ $_ := set $processedDict $name "true" }}
{{-  if lt (len (splitList "/" $path)) 4 }}
{{- $name }},
{{- end }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "locust.labels" -}}
heritage: {{ .Release.Service | quote }}
release: {{ .Release.Name | quote }}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
app: locust
loadtest: {{ .Values.loadtest.name }}
{{- end -}}
