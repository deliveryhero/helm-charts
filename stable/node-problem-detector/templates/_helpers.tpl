{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
*/}}
{{- define "node-problem-detector.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "node-problem-detector.fullname" -}}
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
{{- define "node-problem-detector.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Create the name of the service account to use */}}
{{- define "node-problem-detector.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{ default (include "node-problem-detector.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
{{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the configmap for storing custom monitor definitions
*/}}
{{- define "node-problem-detector.customConfig" -}}
{{- $fullname := include "node-problem-detector.fullname" . -}}
{{- printf "%s-custom-config" $fullname | replace "+" "_" | trunc 63 -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for podSecurityPolicy.
*/}}
{{- define "podSecurityPolicy.apiVersion" -}}
{{- if semverCompare ">=1.10-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "policy/v1beta1" -}}
{{- else -}}
{{- print "extensions/v1beta1" -}}
{{- end -}}
{{- end -}}


{{/*
  Concat npd.config.* to make node-problem-detector CLI args more readable
*/}}
{{- define "npd.cli.args" -}}
{{ include "npd.config.systemLogMonitor" . }} {{ include "npd.config.customPluginMonitor" . }} {{ include "npd.config.prometheus" . }} {{ include "npd.config.k8sExporter" . }}  {{ include "npd.config.extraArgs" . }}
{{- end -}}

{{- define "npd.config.systemLogMonitor" -}}
--config.system-log-monitor=
{{- range $index, $monitor := .Values.settings.log_monitors -}}
  {{- if ne $index 0 -}},{{- end -}}
  {{- $monitor -}}
{{- end -}}
{{- end -}}

{{- define "npd.config.customPluginMonitor" -}}
{{- if .Values.settings.custom_plugin_monitors -}}
--config.custom-plugin-monitor=
{{- range $index, $monitor := .Values.settings.custom_plugin_monitors -}}
  {{- if ne $index 0 -}},{{- end -}}
  {{- $monitor -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "npd.config.prometheus" -}}
{{- printf "--prometheus-address=%s --prometheus-port=%.0f" .Values.settings.prometheus_address .Values.settings.prometheus_port -}}
{{- end -}}

{{- define "npd.config.k8sExporter" -}}
--k8s-exporter-heartbeat-period={{ .Values.settings.heartBeatPeriod }}
{{- end -}}

{{- define "npd.config.extraArgs" -}}
{{- if .Values.settings.extraArgs -}}
{{- range $index, $arg := .Values.settings.extraArgs -}}
  {{- $arg -}}
{{- end -}}
{{- end -}}
{{- end -}}
