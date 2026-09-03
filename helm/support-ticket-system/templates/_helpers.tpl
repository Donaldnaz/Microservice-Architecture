{{/*
=============================================================================
_helpers.tpl — reusable named templates for the support-ticket-system chart.
Included in every resource via {{ include "..." . }}.
=============================================================================
*/}}

{{/*
Chart name, truncated to 63 chars (DNS label limit).
*/}}
{{- define "support-ticket-system.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Fully qualified release name, truncated to 63 chars.
If the release name already contains the chart name, use the release name as-is
to avoid redundant repetition like "support-ticket-system-support-ticket-system".
Example:
  helm install support-ticket-system . → "support-ticket-system"
  helm install prod .                  → "prod-support-ticket-system"
*/}}
{{- define "support-ticket-system.fullname" -}}
{{- if contains .Chart.Name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Common labels applied to every resource.
- helm.sh/chart        : identifies the chart version (useful for auditing)
- app.kubernetes.io/*  : standard Kubernetes recommended labels
These labels enable: kubectl get all -l app.kubernetes.io/instance=<release>
*/}}
{{- define "support-ticket-system.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/part-of: support-ticket-system
{{- end }}

{{/*
Construct the full ECR image URI for a given image tag.
Usage:
  {{ include "support-ticket-system.ecrImage" (dict "root" . "tag" .Values.image.ticketApi.tag) }}
Output:
  <accountId>.dkr.ecr.<region>.amazonaws.com/<ecrRepoName>:<tag>
*/}}
{{- define "support-ticket-system.ecrImage" -}}
{{- printf "%s.dkr.ecr.%s.amazonaws.com/%s:%s"
    .root.Values.aws.accountId
    .root.Values.aws.region
    .root.Values.aws.ecrRepoName
    .tag }}
{{- end }}
