#!/usr/bin/env bash
set -e

SCRIPT_ROOT=$(dirname "${BASH_SOURCE}")
cd $SCRIPT_ROOT

docker build -t python-http:1.0.0 .
kubectl create -f deployments.yaml
kubectl get deployments