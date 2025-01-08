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

{{- define "locust.legacy_image" -}}
"{{ if .Values.master.image }}{{ .Values.master.image }}{{ else }}{{ .Values.image.repository }}:{{ .Values.image.tag }}{{ end }}"
{{- end }}

{{- define "locust.master_image" -}}
  {{- if .Values.image }}
    {{- template "locust.legacy_image" -}}
  {{- else }}
    {{- $repository := .Values.images.master.repository | default .Values.images.defaultLocustRepository -}}
    {{- $tag := .Values.images.master.tag | default .Values.images.defaultLocustTag -}}
    {{- printf "%s:%s" $repository $tag -}}
  {{- end }}
{{- end }}

{{- define "locust.master_pull_policy" -}}
{{- if .Values.image }}
    {{- .Values.image.pullPolicy -}}
  {{- else }}
    {{- .Values.images.master.pullPolicy -}}
  {{- end }}
{{- end }}

{{- define "locust.worker_image" -}}
{{- if .Values.image }}
    {{- template "locust.legacy_image" -}}
  {{- else }}
    {{- $repository := .Values.images.worker.repository | default .Values.images.defaultLocustRepository -}}
    {{- $tag := .Values.images.worker.tag | default .Values.images.defaultLocustTag -}}
    {{- printf "%s:%s" $repository $tag -}}
  {{- end }}
{{- end }}

{{- define "locust.worker_pull_policy" -}}
{{- if .Values.image }}
    {{- .Values.image.pullPolicy -}}
  {{- else }}
    {{- .Values.images.worker.pullPolicy -}}
  {{- end }}
{{- end }}


{{- define "git_sync_image" -}}
  {{- printf "%s:%s" .Values.images.gitSync.repository .Values.images.gitSync.tag }}
{{- end }}

{{/*  Git sync container */}}
{{- define "git_sync_container" }}
- name: {{ .Values.locustfiles.gitSync.containerName }}{{ if .is_init }}-init{{ end }}
  image: {{ template "git_sync_image" . }}
  imagePullPolicy: {{ .Values.images.gitSync.pullPolicy }}
  env:
    - name: GITSYNC_REF
      value: {{ .Values.locustfiles.gitSync.ref | quote }}
    - name: GITSYNC_REPO
      value: {{ .Values.locustfiles.gitSync.repo | quote }}
    - name: GITSYNC_DEPTH
      value: {{ .Values.locustfiles.gitSync.depth | quote }}
    - name: GITSYNC_ROOT
      value: "/git"
    - name: GITSYNC_LINK
      value: "repo"
    - name: GITSYNC_ADD_USER
      value: "true"
    - name: GITSYNC_PERIOD
      value: {{ .Values.locustfiles.gitSync.period | quote }}
    - name: GITSYNC_MAX_FAILURES
      value: {{ .Values.locustfiles.gitSync.maxFailures | quote }}
    {{- if .is_init }}
    - name: GITSYNC_ONE_TIME
      value: "true"
    {{- end }}
    {{- with .Values.locustfiles.gitSync.env }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
  resources: {{ toYaml .Values.locustfiles.gitSync.resources | nindent 4 }}
  volumeMounts:
  - name: locustfiles
    mountPath: /git
  {{- if .Values.locustfiles.gitSync.extraVolumeMounts }}
    {{- tpl (toYaml .Values.locustfiles.gitSync.extraVolumeMounts) . | nindent 2 }}
  {{- end }}
  {{- if and .Values.locustfiles.gitSync.containerLifecycleHooks (not .is_init) }}
  lifecycle: {{- tpl (toYaml .Values.locustfiles.gitSync.containerLifecycleHooks) . | nindent 4 }}
  {{- end }}
{{- end }}

{{- define "locust.locustfiles_mount" }}
- name: locustfiles
  mountPath: {{ .Values.locustfiles.mountPath }}
  readOnly: {{ .Values.locustfiles.gitSync.enabled | ternary "True" "False" }}
{{- end }}
