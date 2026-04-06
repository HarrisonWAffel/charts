{{/* vim: set filetype=mustache: */}}

{{- define "system_default_registry" -}}
{{- if .Values.global.cattle.systemDefaultRegistry -}}
{{- printf "%s/" .Values.global.cattle.systemDefaultRegistry -}}
{{- else -}}
{{- "" -}}
{{- end -}}
{{- end -}}

{{- define "imagePullSecret" -}}
{{- with .Values.global.cattle -}}
{{- printf "{\"auths\":{\"%s\":{\"username\":\"%s\",\"password\":%s,\"auth\":\"%s\"}}}" .systemDefaultRegistry .systemDefaultRegistryPullInfo.username (.systemDefaultRegistryPullInfo.password | quote) (printf "%s:%s" .systemDefaultRegistryPullInfo.username .systemDefaultRegistryPullInfo.password| b64enc) | b64enc }}
{{- end }}
{{- end }}