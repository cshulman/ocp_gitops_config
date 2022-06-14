# Setting up a new cluster 

## Secret Creation 
In order for a cluster to be configurable by ArgoCD, this cluster must be added to the Argo instance in the management cluster. It can be done manually via the Argo UI or by creating a secret in the management cluster. 
The secret contains: 
- The bearer token of a user (preferably a service account) with the neccessary authorization required to apply the configurations to the cluster. This service account will very likely require cluster-admin permissions. 
- Name and server of the cluster to be configured
- It also must contain the `argocd.argoproj.io/secret-type: cluster` label. 
An example secret is shown below and can be found [here](https://github.com/cshulman/ocp_gitops_config/blob/main/gitops-cluster-setup/gitops-cluster-secret.yaml)
```
apiVersion: v1
kind: Secret
metadata:
  name: <cluster-name>-config-secret
  namespace: openshift-gitops
  labels:
    argocd.argoproj.io/secret-type: cluster
type: Opaque
stringData:
  name: <cluster-name>
  server: <cluster-url>
  config: |
    {
      "bearerToken": "<bearer-token>",
      "tlsClientConfig": {
        "serverName": "kubernetes.default.svc",
        "insecure": true
      }
    }
```

### Secret Parameter Configuration
For simplicity, all clusters that will be configured via the Argo instance on the management cluster will be prepped in the same way. That will include:
- A `gitops-config` namespace in the cluster.
- A `gitops-superuser` service account with,
- A ClusterRoleBinding which provides the `gitops-superuser`with `cluster-admin` role.

Manifests to create all resources can be found [here](https://github.com/cshulman/ocp_gitops_config/tree/main/gitops-cluster-setup/new_cluster_config).
