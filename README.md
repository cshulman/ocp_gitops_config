# Configuration Repo to Configure OCP clusters

This repo follows the "App of Apps" pattern where a management cluster manages the configuration of multiple additional clusters.


- #### bases 
Configuration manifests which ArgoCD will apply
- #### overlays 
Utilizing Kustomize, it depicts which bases to apply 
- #### gitops_cluster_setup
Information and manifests for adding a new cluster to be configured by the management cluster
