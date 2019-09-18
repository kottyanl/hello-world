#!/usr/bin/env bash


SCRIPT_ROOT=$(dirname "${BASH_SOURCE}")
cd $SCRIPT_ROOT

test_request () {
    curl -fisS http://$(minikube ip):$1 >>log 2>>err.log
}

rm -f log err.log 

# Test apps listening on different ports
test_request 30500
test_request 30400
test_request 30300

cat log 2>/dev/null
cat err.log 2>/dev/null

[ -s err.log ] && exit 1 || exit 0 