{{- define "pythin-app.name" -}}
pythin-app
{{- end }}

{{- define "pythin-app.fullname" -}}
{{ .Release.Name }}
{{- end }}

{{- define "pythin-app.labels" -}}
app.kubernetes.io/name: {{ include "pythin-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "pythin-app.selectorLabels" -}}
app: {{ include "pythin-app.name" . }}
{{- end }}


{{- define "pythin-app.serviceAccountName" -}}
default
{{- end }}