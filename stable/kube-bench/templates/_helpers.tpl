{{/*
Return the appropriate apiVersion for cronjob APIs.
*/}}
{{- define "cronjob.apiVersion" -}}
{{- if semverCompare "< 1.8-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "batch/v2alpha1" }}
{{- else if semverCompare ">=1.8-0, <1.21-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "batch/v1beta1" }}
{{- else if semverCompare ">=1.21-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "batch/v1" }}
{{- end -}}
{{- end -}}

{{/*
Return appropriate command given the provider
*/}}
{{- define "cronjob.command" -}}
{{- if hasKey .Values.cronjob "command" -}}
{{ toJson .Values.cronjob.command }}
{{- else -}}
{{- if eq "gke" .Values.provider -}}
["kube-bench", "--benchmark", "gke-1.0", "run", "--targets", "node,policies,managedservices"]
{{- else -}}
["kube-bench", "node", "--benchmark", "eks-1.0"]
{{- end }}
{{- end -}}
{{- end -}}
