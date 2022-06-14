# Secret Creation
In order for a cluster to be configurable by ArgoCD, this cluster must be added to the Argo instance in the management cluster. It can be done via the Argo UI or by creating a secret in the management cluster. The secret contains: 
- The bearer token of a user (preferably a service account) with the neccessary authorization required to apply the configurations to the cluster. This service account will very likely require cluster-admin permissions. 
