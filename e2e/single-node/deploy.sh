#!/usr/bin/env bash
set -e

SCRIPT_ROOT=$(dirname "${BASH_SOURCE}")
cd $SCRIPT_ROOT

eval $(minikube docker-env)
docker build -t python-http:1.0.1 ..
kubectl apply -f deployments.yaml
kubectl apply -f services.yaml
kubectl apply -f zorp-ingress.yaml
kubectl apply -f ingress.yaml
kubectl wait --for=condition=available --timeout=600s deployment/http-app-1
kubectl wait --for=condition=available --timeout=600s deployment/http-app-2
kubectl wait --for=condition=available --timeout=600s deployment/http-app-3
kubectl wait --for=condition=available --timeout=600s deployment/zorp-ingress -n zorp-controller
kubectl get deployments -A
kubectl get pods -o wide -A
kubectl get svc
# probably zorp configuration is not processed yet
sleep 300