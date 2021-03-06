{{/*
Expand the name of the chart.
*/}}
{{- define "bitcoin-core.name" -}}
{{- default .Chart.Name .Values.global.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "bitcoin-core.fullname" -}}
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
{{- define "bitcoin-core.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "bitcoin-core.labels" -}}
app: {{ include "bitcoin-core.name" . | quote }}
helm.sh/chart: {{ include "bitcoin-core.chart" . | quote }}
{{ include "bitcoin-core.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "bitcoin-core.selectorLabels" -}}
app.kubernetes.io/name: {{ include "bitcoin-core.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{/*
Prometheus annotations
*/}}
{{- define "bitcoin-core.prometheusAnnotations" -}}
{{- if and .Values.exporter.enabled (not .Values.podMonitor.enabled) (not (.Capabilities.APIVersions.Has "monitoring.coreos.com/v1/PodMonitor")) -}}
prometheus.io/port: "9332"
prometheus.io/scrape: "true"
{{- end -}}
{{- end -}}
