{{/* Expand the name of the chart. */}}
{{- define "http_mock.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Create chart name and version as used by the chart label. */}}
{{- define "http_mock.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels */}}
{{- define "http_mock.labels" -}}
helm.sh/chart: {{ include "http_mock.chart" . }}
{{ include "http_mock.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.labels }}
{{- range $key, $value := .Values.labels }}
{{ $key }}: {{ $value | quote }}
{{- end }}
{{- end }}
{{- end }}


{{/* Selector labels */}}
{{- define "http_mock.selectorLabels" -}}
app.kubernetes.io/name: {{ include "http_mock.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Imposters mounting path */}}
{{- define "http_mock.imposters_mouniting_path" -}}
{{- printf .Values.mock.imposters.path | default "/imposters" }}
{{- end }}

{{/* Killgrave image */}}
{{- define "http_mock.image" -}}
{{- $tag := .Values.mock.killgrave.tag | default "latest" }}
{{- printf "friendsofgo/killgrave:%s" $tag }}
{{- end }}