import Foundation

enum Constants {
    // MARK: - Tink Link

    static let tinkLinkUrl = "https://link.tink.com/1.0/authorize"

    // MARK: - OAuth2 configuration

    static let clientId = "<#CLIENTID#>"
    static let redirectUri = URL(string: "demo://authorize")!
    static let scope = "accounts:read,transactions:read,investments:read,user:read"

    // MARK: - Demo server

    // See documentation on how to run your own server (https://github.com/tink-ab/tink-connect-example/blob/master/server.js)
    static let demoDataUrl = URL(string: "http://localhost:8080/callback")!
}
