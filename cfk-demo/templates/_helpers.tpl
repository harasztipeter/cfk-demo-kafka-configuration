{{- define "extract-stage-name" -}}
{{- if .Files }}
{{- $filesCpy := .Files | mustDeepCopy -}}
{{- range $k, $v := $filesCpy -}}
    {{ $parts := split "/" $k }}
    {{  $stage := index $parts "_0" }}
    {{ printf "%s" $stage }}
    {{- break -}}
{{- end -}}
{{- else }}
{{- print ""}}
{{- end }}
{{- end -}}