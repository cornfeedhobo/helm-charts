# bitcoin-core

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 22.0-alpine](https://img.shields.io/badge/AppVersion-22.0--alpine-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity is a group of affinity scheduling rules More info: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#affinity-v1-core |
| bitcoind.config.additionalOptions | string | `nil` |  |
| bitcoind.config.p2pbind | string | `"0.0.0.0"` |  |
| bitcoind.config.rpcallowip | string | `"0.0.0.0"` |  |
| bitcoind.config.rpcbind | string | `"0.0.0.0"` |  |
| bitcoind.image.pullPolicy | string | `"IfNotPresent"` |  |
| bitcoind.image.repository | string | `"ruimarinho/bitcoin-core"` |  |
| bitcoind.image.tag | string | `""` |  |
| bitcoind.ports.p2p | int | `8333` |  |
| bitcoind.ports.rpc | int | `8332` |  |
| bitcoind.resources | object | `{}` |  |
| bitcoind.rpcPassword | string | `"rpcpassword"` | RPC password |
| bitcoind.rpcUsername | string | `"rpcuser"` | RPC username |
| bitcoind.securityContext | object | `{}` |  |
| bitcoind.service.p2p | object | `{"type":"NodePort"}` | Change to NodePort or LoadBalancer to expose the p2p service to the public. |
| bitcoind.service.rpc | object | `{"type":"ClusterIP"}` | Normally the RPC service is only exposed locally. |
| exporter.enabled | bool | `false` |  |
| exporter.image.pullPolicy | string | `"IfNotPresent"` |  |
| exporter.image.repository | string | `"jvstein/bitcoin-prometheus-exporter"` |  |
| exporter.image.tag | string | `"v0.7.0"` |  |
| exporter.resources | object | `{}` |  |
| exporter.securityContext | object | `{}` |  |
| imagePullSecrets | list | `[]` | Secret needed to pull from a private registry More info: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| nodeSelector | object | `{}` | NodeSelector is a selector which must be true for the pod to fit on a node. Selector which must match a node's labels for the pod to be scheduled on that node. More info: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/ |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `true` |  |
| persistence.existingClaim | string | `nil` |  |
| persistence.size | string | `"500Gi"` |  |
| podAnnotations | object | `{}` | Pod Annotations More info: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#objectmeta-v1-meta |
| podSecurityContext | object | `{}` | SecurityContext holds pod-level security attributes and common container settings. Optional: Defaults to empty. See type description for default values of each field. More info: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#podsecuritycontext-v1-core |
| tolerations | list | `[]` | If specified, the pod's tolerations. More info: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#toleration-v1-core |
