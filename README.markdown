![Platform](https://img.shields.io/badge/platform-iOS-orange.svg)
![Languages](https://img.shields.io/badge/languages-swift-orange.svg)
[![Build Status](https://travis-ci.org/tink-ab/tink-connect-ios-example.svg?branch=master)](https://travis-ci.org/tink-ab/tink-connect-ios-example)

<img src=".github/TinkConnectExample.png" />

# Tink Connect Example for iOS

This is an example app that demonstrates how you can integrate your apps with the Tink API.

## Installation

The application requires a Tink API developer account and a server component to run.

### Prerequisites

1) Follow the [getting started guide](https://console.tink.se/getting-started) to create your developer account
2) Retrieve your [OAuth client credentials](https://console.tink.se/getting-started#2-get-your-oauth-client-details)
3) Update the [list of allowed](https://console.tink.se/settings) `redirectUris` with a deep link to your app:

`$ curl -X PUT https://api.tink.se/api/v1/oauth/manager/client/<CLIENTID> -u "<EMAIL>:<PASSWORD>" -H 'Content-Type: application/json' -d '{ "redirectUris": ["http://localhost:3000/callback", "demo://authorize"] }'`

### Example server

1) Clone the web & server example for [Tink Connect](https://github.com/tink-ab/tink-connect-example)

`$ git clone https://github.com/tink-ab/tink-connect-example`

2) Run

`$ CLIENT_ID=<CLIENTID> CLIENT_SECRET=<SECRET> npm install && npm run dev`

### Example app

1) Open `TinkConnectExample.xcodeproj` and run the target.
2) Update [Constants.swift](TinkConnectExample/Constants.swift#L6) with your client identifier
3) Build & run

## Resources

* Read our [getting started guide](https://console.tink.se/getting-started)
* Check out our [tutorials](https://console.tink.se/tutorials) and [demo apps](https://console.tink.se/demo)
* Check out the [Tink API documentation](https://docs.tink.se)
* Visit the [Tink Developer Console](https://console.tink.se) for more resources

## Support

👋 We are continuously working on improving the developer experience of our API offering. For any questions or suggestions for improvement, contact us at [api-support@tink.se](mailto:api-support@tink.se).
