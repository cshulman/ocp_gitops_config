#!/bin/bash


oc create -f namespace.yaml

oc create -f service-account.yaml

oc create -f cluster-rolebinding.yaml


# Get token of newly created sa
oc sa get-token gitops-superuser -n gitops-config

