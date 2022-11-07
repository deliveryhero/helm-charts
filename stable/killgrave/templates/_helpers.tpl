{{/* Expand the name of the chart. */}}
{{- define "killgrave.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Create chart name and version as used by the chart label. */}}
{{- define "killgrave.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels */}}
{{- define "killgrave.labels" -}}
helm.sh/chart: {{ include "killgrave.chart" . }}
{{ include "killgrave.selectorLabels" . }}
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
{{- define "killgrave.selectorLabels" -}}
app.kubernetes.io/name: {{ include "killgrave.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Imposters mounting path */}}
{{- define "killgrave.imposters_mouniting_path" -}}
{{- printf .Values.mock.imposters.path | default "/imposters" }}
{{- end }}

{{/* Killgrave image */}}
{{- define "killgrave.image" -}}
{{- $tag := .Values.mock.killgrave.tag | default "latest" }}
{{- printf "friendsofgo/killgrave:%s" $tag }}
{{- end }}
