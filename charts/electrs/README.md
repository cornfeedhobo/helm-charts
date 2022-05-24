# electrs

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.9.4](https://img.shields.io/badge/AppVersion-v0.9.4-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| configMap.annotations | object | `{}` | Set configMap annotations. Helm templates can be used. |
| configMap.labels | object | `{}` | Set configMap labels. Helm templates can be used. |
| controller.annotations | object | `{}` | Configure the statefulset annotations. Helm templates can be used. |
| controller.labels | object | `{}` | Configure the statefulset labels. Helm templates can be used. |
| controller.revisionHistoryLimit | int | `3` | ReplicaSet revision history limit. |
| electrs.bitcoinPVC | string | `""` | Set the name of the PVC used by the bitcoin daemon. If set, it will be mounted into the electrs container. |
| electrs.config | object | `{"daemon_p2p_addr":"bitcoin-core:8333","daemon_rpc_addr":"bitcoin-core:8332","db_dir":"/data","electrum_rpc_addr":"0.0.0.0:{{ .Values.electrs.ports.electrum }}","monitoring_addr":"0.0.0.0:{{ .Values.electrs.ports.exporter }}","network":"bitcoin"}` | electrs config file settings. Helm templates can be used. See schema at https://github.com/romanz/electrs/blob/master/internal/config_specification.toml |
| electrs.image.pullPolicy | string | `"IfNotPresent"` | Configure electrs image pull policy |
| electrs.image.repo | string | `"docker.io/getumbrel/electrs"` | Configure electrs image repo |
| electrs.image.tag | string | `""` | Configure electrs image tag, defaults to .Chart.AppVersion |
| electrs.ports.electrum | int | `50001` | Configure electrum address and port |
| electrs.ports.exporter | int | `4224` | Configure exporter address and port |
| electrs.resources | object | `{}` | Configure pod resources. |
| electrs.securityContext | object | `{}` | Configure the Security Context. |
| global.annotations | object | `{}` | Set additional global annotations. Helm templates can be used. |
| global.fullnameOverride | string | `""` | Set the entire name definition. |
| global.imagePullSecrets | list | `[]` | Set image pull secrets. More info: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| global.labels | object | `{}` | Set additional global labels. Helm templates can be used. |
| global.nameOverride | string | `""` | Set an override for the prefix of the fullname. |
| persistence.accessMode | string | `"ReadWriteOnce"` | The desired access modes the volume should have. |
| persistence.annotations | object | `{}` | Configure the persistence annotations. Helm templates can be used. |
| persistence.enabled | bool | `false` | Toggle the creation of a persistent volume. |
| persistence.existingClaim | string | `nil` | Optionally mount an existing persistent volume claim. |
| persistence.labels | object | `{}` | Configure the persistence labels. Helm templates can be used. |
| persistence.size | string | `"100Gi"` | Size of the persistent volume. |
| persistence.storageClass | string | `""` | Persistent Volume Storage Class. If defined, storageClassName: <storageClass>. If set to "-", storageClassName: "", which disables dynamic provisioning. If undefined (the default) or set to null, no storageClassName spec is set, choosing the default provisioner.  (gp2 on AWS, standard on GKE, AWS & OpenStack). |
| pod.affinity | object | `{}` | Affinity is a group of affinity scheduling rules. More info: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#affinity-v1-core |
| pod.annotations | object | `{}` | Set pod annotations. Helm templates can be used. |
| pod.labels | object | `{}` | Set pod labels. Helm templates can be used. |
| pod.nodeSelector | object | `{}` | NodeSelector is a selector which must be true for the pod to fit on a node. Selector which must match a node's labels for the pod to be scheduled on that node. More info: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/ |
| pod.securityContext | object | `{}` | SecurityContext holds pod-level security attributes and common container settings. Optional: Defaults to empty. See type description for default values of each field. More info: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#podsecuritycontext-v1-core |
| pod.tolerations | list | `[]` | If specified, the pod's tolerations. More info: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#toleration-v1-core |
| podMonitor.annotations | object | `{}` | Set pod annotations. Helm templates can be used. |
| podMonitor.enabled | bool | `false` | Create the PodMonitor resource. |
| podMonitor.interval | string | `"15s"` | scrape interval. |
| podMonitor.labels | object | `{}` | Set pod labels. Helm templates can be used. |
| podMonitor.timeout | string | `"10s"` | scrape timeout. |
| service.annotations | object | `{}` | Configure the service annotations. Helm templates can be used. |
| service.labels | object | `{}` | Configure the service labels. Helm templates can be used. |
| service.type | string | `"ClusterIP"` | Configure service type. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.10.0](https://github.com/norwoodj/helm-docs/releases/v1.10.0)
