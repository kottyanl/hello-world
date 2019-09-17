#!/usr/bin/env bash


SCRIPT_ROOT=$(dirname "${BASH_SOURCE}")
cd $SCRIPT_ROOT

kubectl get pods -o wide

sleep 30

kubectl get pods -o wide

sleep 30

kubectl get pods -o wide

echo $(minikube ip)

curl http://$(minikube ip):30500

curl http://$(minikube ip):30400

echo 'DONE'


# curl http://localhost
# curl http://localhost:30500
# docker exec -it kind-control-plane curl http://localhost:30500

# docker exec -it kind-control-plane curl -v http://localhost:30500

# test_request () {
#     echo $(docker exec -it kind-control-plane curl http://127.0.0.1:$1) >> results.txt
# }

# rm -f results.txt 

# # Test apps listening on different ports
# test_request 30500
# test_request 30400
# test_request 30300

# cat results.txt

# # Check and set exit status
# while read p; do
#   if [[ "$p" != "Hello"* ]]; then
#     exit 1
#   fi
# done <results.txt
# exit 0