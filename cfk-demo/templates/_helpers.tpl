{{- define "build-principal-name" -}}
{{- if .Template.Name }}
{{- $dummy := .Template.Name -}}
{{ $parts := split "/" $dummy }}
{{ $parentDir := index $parts "_0" }}
{{ printf "kafka_%s" $parentDir }}
{{- else }}
{{- print ""}}
{{- end }}
{{- end -}}