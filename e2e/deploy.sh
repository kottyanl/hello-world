#!/usr/bin/env bash
set -e

docker build -t python-http:1.0.0 .
kubectl create -f deployments.yaml