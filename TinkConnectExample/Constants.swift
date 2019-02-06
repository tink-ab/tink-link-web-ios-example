import Foundation

enum Constants {
    // MARK: - OAuth2 configuration

    static let clientId = "<#CLIENTID#>"
    static let redirectUri = "demo://authorize"
    static let scope = "accounts:read,transactions:read,investments:read,user:read"

    // MARK: - Demo server

    // See documentation on how to run your own server (https://github.com/tink-ab/tink-connect-example/blob/master/server.js)
    static let demoDataUrl = URL(string: "https://localhost:3000/callback")!
}
