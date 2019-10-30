import Foundation

enum Constants {
    // MARK: - Tink Link

    static let tinkLinkUrl = "https://link.tink.com/1.0/authorize"

    // MARK: - OAuth2 configuration

    /// Replace this with the clientId you registered in https://console.tink.com
    static let clientId: String = <#CLIENT ID#>

    /// The requested scopes that will be granted to your access token
    static let scope = "accounts:read transactions:read investments:read user:read"

    /// This is the redirect URI where you will receive the authorization code after completing the flow in Tink Link
    ///
    ///  This URI needs to be registered for you client in https://console.tink.com
    static let redirectUri = URL(string: "demo://authorize")!

    /// This is the deep link URI that will be used to return to your app from a thirdparty authentication app
    static let appUri = URL(string: "demo://")!

    // MARK: - Demo server

    /// The demo server that holds your client secret and will facilitate access to the retrieved data
    ///
    /// See documentation on how to run your own server (https://github.com/tink-ab/tink-connect-example/blob/master/server.js)
    static let demoDataUrl = URL(string: "http://localhost:8080/callback")!
}
