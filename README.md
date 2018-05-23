# cypress-test
e2e cypress test examples for local news

## Instructions
1. npm install
2. npm run cypress:open
3. Cypress will open and detect all test suites in cypress integration. Double click a test suite to run

## Documentation
https://docs.cypress.io/guides/overview/why-cypress.html#
https://docs.cypress.io/api/introduction/api.html#

## Dealing with flake
Cypress makes things easier a bit in regards to flake. Cypress has a visual UI that runs in the browser that we can use to debug and flakey tests.
These guides contain some good tips on writing reliable tests.
https://docs.cypress.io/guides/references/best-practices.html
https://docs.cypress.io/guides/guides/network-requests.html#Flake

## CI Build
As part of the CI process the tests are running inside a docker container that uses the official cypress Debian image
https://github.com/cypress-io/cypress-docker-images/tree/master/browsers/chrome63-ff57

## Docker Instructions
```bash
docker build -t cypress-test:latest .
docker run --rm -v `pwd`:/usr/local/bbc -t cypress-test:latest bash -lc "cypress run"
```

## Fig redirect
We block all requests to the fig redirect route in the cyprss.config file to stop redirects from international locations. This redirect happens as part of the CI process because the jenkins server is in Ireland


## Cypress enviroment variables
We can pass in enviorment variables into cypress by suing the --env parameter when running cypress:

```bash
cypress run -s cypress/integration/topic_page.spec.js --env buildnumber=$RELEASEVERSION,testnumber=$BUILDNUMBER,cosmoscertpath=/etc/pki/tls/certs/client.crt,cosmoskeypath=/etc/pki/tls/private/client.key
```

we can then access them by using
```javascript
Cypress.env("buildNumber")
```


