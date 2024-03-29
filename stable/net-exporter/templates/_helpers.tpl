{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "labels.common" -}}
{{- include "labels.selector" . -}}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/name: {{ .Values.name | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
giantswarm.io/service-type: "{{ .Values.serviceType }}"
helm.sh/chart: {{ include "chart" . | quote }}
{{- if hasKey .Values "additionalLabels" }}
{{- range $key, $value := .Values.additionalLabels }}
{{ $key }}: {{ $value | quote }}
{{- end }}
{{- end }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "labels.selector" -}}
{{- range $key, $value := .Values.selector }}{{ $key }}: {{ $value | quote }}
{{ end }}
{{- end -}}
