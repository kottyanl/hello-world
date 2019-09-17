#!/usr/bin/env bash


SCRIPT_ROOT=$(dirname "${BASH_SOURCE}")
cd $SCRIPT_ROOT

test_request () {
    echo $(kubectl exec -it minikube curl --max-time 30 http://localhost:$1) >> results.txt
}

rm -f results.txt 

# Test apps listening on different ports
test_request 30500
test_request 30400
test_request 30300

cat results.txt

# Check and set exit status
while read p; do
  if [[ "$p" != "Hello"* ]]; then
    exit 1
  fi
done <results.txt
exit 0