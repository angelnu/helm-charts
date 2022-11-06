{{/* Make sure all variables are set properly */}}
{{- include "bjw-s.common.loader.init" . -}}

{{- define "dnsmadeeasy-webhook.selfSignedIssuer" -}}
{{ printf "%s-selfsign" (include "bjw-s.common.lib.chart.names.fullname" .) }}
{{- end -}}

{{- define "dnsmadeeasy-webhook.rootCAIssuer" -}}
{{ printf "%s-ca" (include "bjw-s.common.lib.chart.names.fullname" .) }}
{{- end -}}

{{- define "dnsmadeeasy-webhook.rootCACertificate" -}}
{{ printf "%s-ca" (include "bjw-s.common.lib.chart.names.fullname" .) }}
{{- end -}}

{{- define "dnsmadeeasy-webhook.servingCertificate" -}}
{{- if .Values.generateCerts }}
{{- printf "%s-webhook-tls" (include "bjw-s.common.lib.chart.names.fullname" .) }}
{{- else -}}
{{- printf "%s-cert-manager-webhook-ca" (include "bjw-s.common.lib.chart.names.fullname" .) }}
{{- end -}}
{{- end -}}


{{/* Append the hardcoded settings */}}
{{- define "dnsmadeeasy-webhook.harcodedValues" -}}

# -- Configure persistence settings for the chart under this key.
persistence:
  certs:
    enabled: true
    type: custom
    mountPath: /tls
    readOnly: true
    volumeSpec:
      secret:
        secretName: {{ include "dnsmadeeasy-webhook.servingCertificate" . }}

probes:
  liveness:
    enabled: true
    custom: true
    spec:
      httpGet:
        scheme: HTTPS
        path: /healthz
        port: https
  readiness:
    enabled: true
    custom: true
    spec:
      httpGet:
        scheme: HTTPS
        path: /healthz
        port: https
  startup:
    enabled: true
    custom: true
    spec:
      httpGet:
        scheme: HTTPS
        path: /healthz
        port: https

service:
  main:
    ports:
      http:
        enabled: false
      https:
        enabled: true
        targetPort: 4443
        port: 443

args:
- --tls-cert-file=/tls/tls.crt
- --tls-private-key-file=/tls/tls.key
- --secure-port=4443

env:
  GROUP_NAME: {{ .Values.groupName }}

{{- end -}}
{{- $_ := mergeOverwrite .Values (include "dnsmadeeasy-webhook.harcodedValues" . | fromYaml) -}}


{{/* Render the templates */}}
{{- include "bjw-s.common.loader.generate" . -}}
