{{- define "system_default_registry" -}}
{{- if .Values.global.cattle.systemDefaultRegistry -}}
{{- printf "%s/" .Values.global.cattle.systemDefaultRegistry -}}
{{- else -}}
{{- "" -}}
{{- end -}}
{{- end -}}

{{- define "imagePullSecrets" -}}
{{- if .Values.global.cattle.imagePullSecrets }}
imagePullSecrets:
  {{- range .Values.global.cattle.imagePullSecrets }}
  - name: {{ . }}
  {{- end }}
{{- end }}
{{- end -}}
