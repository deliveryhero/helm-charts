################################################################################
# Standard helpers
################################################################################

{{- define "resource_name" }}
{{- printf "%s-%s-%s" .Values.env .Chart.Name -}}
{{- end }}

{{- define "labels" }}
app: {{ .Chart.Name | quote }}
env: {{ .Values.env | quote }}
team: {{ .Values.team | quote }}
{{- end }}
