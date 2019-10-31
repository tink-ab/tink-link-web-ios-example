![Platform](https://img.shields.io/badge/platform-iOS-orange.svg)
![Languages](https://img.shields.io/badge/languages-swift-orange.svg)
[![Build Status](https://travis-ci.org/tink-ab/tink-connect-ios-example.svg?branch=master)](https://travis-ci.org/tink-ab/tink-connect-ios-example)

<img src=".github/TinkConnectExample.png" />

# Tink Connect Example for iOS

This is an example app that demonstrates how you can integrate your apps with the Tink API.

## Installation

The application requires a Tink API developer account and a server component to run.

### Prerequisites

1) Create your developer account at [Tink Console](https://console.tink.com)
2) Follow the [getting started guide](https://docs.tink.com/resources/getting-started/set-up-your-account) to retrieve your `client_id` and `client_secret`
3) Add a deep link to the example app (`demo://authorize`) to the [list of redirect URIs under your app's settings](https://console.tink.com/overview)

### Example server

1) Clone the web & server example for [Tink Connect](https://github.com/tink-ab/tink-connect-example)

```
$ git clone https://github.com/tink-ab/tink-connect-example
```

2) Run

```
$ export REACT_APP_CLIENT_ID="<CLIENTID>"
$ export REACT_APP_CLIENT_SECRET="<SECRET>"
$ npm install && npm run server
```

### Example app

1) Open `TinkConnectExample.xcodeproj`
2) Update [Constants.swift](TinkConnectExample/Constants.swift#L6) with your client identifier
3) Build and run

## Resources

* Visit the [Tink Console](https://console.tink.com) to create an account
* Read our [getting started guide](https://docs.tink.com/resources/getting-started)
* Explore our [resources](https://docs.tink.com/resources/) for tutorials, libraries and demo apps
* Check out the [Tink API documentation](https://docs.tink.com/api)

## Support

👋 We are continuously working on improving the developer experience of our API offering. [Contact us](https://tinkab.atlassian.net/servicedesk/customer/portal/5) for support, questions or suggestions.
