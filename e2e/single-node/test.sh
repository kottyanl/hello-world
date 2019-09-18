#!/usr/bin/env bash


SCRIPT_ROOT=$(dirname "${BASH_SOURCE}")
cd $SCRIPT_ROOT

test_request () {
    curl -fisS http://$(minikube ip):$1 >> log 2>>err.log
    echo -e '\n' >> log
}

rm -f log err.log 

# Test apps listening on different ports
test_request 30500
test_request 30400
test_request 30300

echo -e '\nTEST DONE\n'

if [ -f "log" ]; then
  echo -e "\n\nRESPONSES:\n"
  cat log
fi

if [ -f "err.log" ]; then
  echo -e "\n\nERRORS:\n"
  cat err.log
fi

[ -s err.log ] && exit 1 || exit 0 