# bitcoin-core

![Version: 0.5.0](https://img.shields.io/badge/Version-0.5.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 24-alpine](https://img.shields.io/badge/AppVersion-24--alpine-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| bitcoind.config | object | `{"bind":"0.0.0.0","rpcallowip":"0.0.0.0/0","rpcbind":"0.0.0.0","rpcport":"{{ .Values.bitcoind.ports.rpc }}"}` | bitcoind config file settings. Helm templates can be used. |
| bitcoind.image.pullPolicy | string | `"IfNotPresent"` | Configure image pull policy. |
| bitcoind.image.repository | string | `"ruimarinho/bitcoin-core"` | Configure image repo. |
| bitcoind.image.tag | string | `""` | Configure image tag, defaults to .Chart.AppVersion. |
| bitcoind.ports.p2p | int | `8333` | Configure the P2P port. |
| bitcoind.ports.rpc | int | `8332` | Configure the RPC port. |
| bitcoind.resources | object | `{}` | Configure pod resources. |
| bitcoind.securityContext | object | `{}` | Configure the Security Context. |
| configMap.annotations | object | `{}` | Set configMap annotations. Helm templates can be used. |
| configMap.labels | object | `{}` | Set configMap labels. Helm templates can be used. |
| controller.annotations | object | `{}` | Configure the statefulset annotations. Helm templates can be used. |
| controller.labels | object | `{}` | Configure the statefulset labels. Helm templates can be used. |
| controller.revisionHistoryLimit | int | `3` | ReplicaSet revision history limit. |
| exporter.enabled | bool | `false` | Toggle the prometheus exporter sidecar. |
| exporter.grafana | object | `{"createDashboardConfigMap":false,"datasourceName":"Prometheus","sidecarLabel":"grafana_dashboard"}` | Configure grafana dashboards when using the supporting sidecar. More info: https://github.com/grafana/helm-charts/blob/main/charts/grafana/README.md#sidecar-for-dashboards |
| exporter.grafana.createDashboardConfigMap | bool | `false` | toggle the creation of the grafana dashboard. |
| exporter.grafana.datasourceName | string | `"Prometheus"` | grafana's prometheus datasource name. |
| exporter.grafana.sidecarLabel | string | `"grafana_dashboard"` | label for the sidecar to pick up the dashboard config. |
| exporter.image.pullPolicy | string | `"IfNotPresent"` | Configure image pull policy. |
| exporter.image.repository | string | `"jvstein/bitcoin-prometheus-exporter"` | Configure image repo. |
| exporter.image.tag | string | `"v0.7.0"` | Configure image tag. |
| exporter.resources | object | `{}` | Configure pod resources. |
| exporter.securityContext | object | `{"runAsGroup":101,"runAsUser":100}` | Configure the Security Context. Defaults to matching the bitcoin container's default. |
| global.annotations | object | `{}` | Set additional global annotations. Helm templates can be used. More info: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#objectmeta-v1-meta |
| global.fullnameOverride | string | `""` | Set the entire name definition. |
| global.imagePullSecrets | list | `[]` | Set image pull secrets. More info: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| global.labels | object | `{}` | Set additional global labels. Helm templates can be used. |
| global.nameOverride | string | `""` | Set an override for the prefix of the fullname. |
| persistence.accessMode | string | `"ReadWriteOnce"` | The desired access modes the volume should have. |
| persistence.annotations | object | `{}` | Configure the persistence annotations. Helm templates can be used. |
| persistence.enabled | bool | `false` | Toggle the creation of a persistent volume. |
| persistence.existingClaim | string | `nil` | Optionally mount an existing persistent volume claim. |
| persistence.labels | object | `{}` | Configure the persistence labels. Helm templates can be used. |
| persistence.retentionPolicy | object | `{}` | https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#persistentvolumeclaim-retention |
| persistence.size | string | `"500Gi"` | Size of the persistent volume. |
| persistence.storageClass | string | `""` | Persistent Volume Storage Class. If defined, storageClassName: <storageClass>. If set to "-", storageClassName: "", which disables dynamic provisioning. If undefined (the default) or set to null, no storageClassName spec is set, choosing the default provisioner.  (gp2 on AWS, standard on GKE, AWS & OpenStack). |
| pod.affinity | object | `{}` | Affinity is a group of affinity scheduling rules. More info: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#affinity-v1-core |
| pod.annotations | object | `{}` | Set pod annotations. Helm templates can be used. |
| pod.labels | object | `{}` | Set pod labels. Helm templates can be used. |
| pod.nodeSelector | object | `{}` | NodeSelector is a selector which must be true for the pod to fit on a node. Selector which must match a node's labels for the pod to be scheduled on that node. More info: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/ |
| pod.securityContext | object | `{}` | SecurityContext holds pod-level security attributes and common container settings. Optional: Defaults to empty. See type description for default values of each field. More info: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#podsecuritycontext-v1-core |
| pod.terminationGracePeriodSeconds | int | `300` | Ensure bitcoind has enough time to gracefully stop |
| pod.tolerations | list | `[]` | If specified, the pod's tolerations. More info: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#toleration-v1-core |
| podMonitor.annotations | object | `{}` | Set pod annotations. Helm templates can be used. |
| podMonitor.enabled | bool | `false` | Create the PodMonitor resource. |
| podMonitor.interval | string | `"15s"` | scrape interval. |
| podMonitor.labels | object | `{}` | Set pod labels. Helm templates can be used. |
| podMonitor.timeout | string | `"10s"` | scrape timeout. |
| service.annotations | object | `{}` | Configure the service annotations. Helm templates can be used. |
| service.enableP2p | bool | `true` | Toggle the exposure of the bitcoin p2p port. |
| service.enableRpc | bool | `true` | Toggle the exposure of the bitcoin rpc port. |
| service.labels | object | `{}` | Configure the service labels. Helm templates can be used. |
| service.sessionAffinity | string | `"ClientIP"` | Configure service affinity. |
| service.type | string | `"ClusterIP"` | Configure service type. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.13.1](https://github.com/norwoodj/helm-docs/releases/v1.13.1)
