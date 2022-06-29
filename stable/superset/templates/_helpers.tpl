{{/*
Expand the name of the chart.
*/}}
{{- define "superset.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "superset.fullname" -}}
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
{{- define "superset.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "superset.labels" -}}
helm.sh/chart: {{ include "superset.chart" . }}
{{ include "superset.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.extraLabels }}
{{ toYaml .Values.extraLabels }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "superset.selectorLabels" -}}
app.kubernetes.io/name: {{ include "superset.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "superset.celery.selectorLabels" -}}
app.kubernetes.io/name: {{ include "superset.name" . }}-celery-beat
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "superset.worker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "superset.name" . }}-worker
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "superset.redis.uri" -}}
{{ if .Values.superset.redis.password}}
{{- printf "%s@%s:%v" "{env('REDIS_PASSWORD')}" .Values.superset.redis.hostname .Values.superset.redis.port}}
{{- else }}
{{- printf "%s:%v" .Values.superset.redis.hostname .Values.superset.redis.port}}
{{- end }}
{{- end }}

{{- define "superset.database.address" -}}
{{- printf "%s:%v/%s" .Values.superset.database.hostname .Values.superset.database.port .Values.superset.database.name }}
{{- end }}
