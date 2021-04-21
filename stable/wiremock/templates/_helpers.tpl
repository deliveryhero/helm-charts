{{/* vim: set filetype=mustache: */}}
{{/*
Note: we truncate names at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{/*
Expand the chart name.
*/}}
{{- define "wiremock.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified application name.
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wiremock.fullname" -}}
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
{{- define "wiremock.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "wiremock.selector.labels" -}}
app.kubernetes.io/name: {{ include "wiremock.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
consumer: {{ .Values.consumer.name | quote }}
{{- end }}

{{/*
Labels
*/}}
{{- define "wiremock.labels" -}}
helm.sh/chart: {{ include "wiremock.chart" . }}
app.kubernetes.io/name: {{ include "wiremock.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
heritage: {{ .Release.Service | quote }}
release: {{ .Release.Name | quote }}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
app: {{ .Chart.Name | quote }}
consumer: {{ .Values.consumer.name | quote }}
{{- if .Values.extraLabels }}
{{toYaml .Values.extraLabels }}
{{- end }}
{{- end -}}
