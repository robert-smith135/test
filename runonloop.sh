#!/bin/bash
passcounter=0
failcounter=0
while [ 0 = 0 ]; do
    if docker run --rm -v `pwd`:/usr/local/bbc -t cypress-test:latest bash -lc "cypress run -s cypress/integration/topicPage.spec.js"; then
        passcounter=$((passcounter+1))
        echo "Passed: $passcounter time(s)"
        echo "Failed: $failcounter time(s)"
    else
        failcounter=$((failcounter+1))
        echo "Passed: $passcounter time(s)"
        echo "Failed: $failcounter time(s)"
    fi
done;
