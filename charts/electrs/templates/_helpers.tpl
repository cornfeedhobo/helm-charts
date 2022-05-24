{{/*
Expand the name of the chart.
*/}}
{{- define "electrs.name" -}}
{{- default .Chart.Name .Values.global.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "electrs.fullname" -}}
{{- if .Values.global.fullnameOverride }}
{{- .Values.global.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.global.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "electrs.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "electrs.labels" -}}
app: {{ include "electrs.name" . | quote }}
helm.sh/chart: {{ include "electrs.chart" . | quote }}
{{ include "electrs.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "electrs.selectorLabels" -}}
app.kubernetes.io/name: {{ include "electrs.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "electrs.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "electrs.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Prometheus annotations
*/}}
{{- define "electrs.prometheusAnnotations" -}}
{{- if and (not .Values.podMonitor.enabled) (not (.Capabilities.APIVersions.Has "monitoring.coreos.com/v1/PodMonitor")) -}}
prometheus.io/port: "{{ .Values.electrs.ports.exporter }}"
prometheus.io/scrape: "true"
{{- end -}}
{{- end -}}
