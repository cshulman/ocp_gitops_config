#!/bin/bash

# create & prep amq_streams ns
oc create -f namespace.yaml

# create amq_streams subscription
oc create -f amq-streams-sub.yaml


