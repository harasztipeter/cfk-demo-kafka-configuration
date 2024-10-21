{{- define "build-principal-name" -}}
{{- if .Files }}
{{- $dummy := .Files | mustDeepCopy -}}
{{- range $k, $v := $dummy -}}
    {{  printf "kafka_%s" $k }}
{{- end -}}
{{- else }}
{{- print ""}}
{{- end }}
{{- end -}}