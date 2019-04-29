import Foundation

private let tinkConnectBaseUrl = "https://oauth.tink.com/0.4/authorize"

struct AuthorizationUrlBuilder {
    let clientId: String
    let redirectUri: String
    let scope: String
    let market: String
    let locale: String
    let state: String?
    let iframe: Bool

    func build() -> URL? {
        guard let baseUrl = URL(string: tinkConnectBaseUrl) else {
            fatalError("Invalid base URL")
        }

        guard var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false) else {
            fatalError("Invalid base URL")
        }

        components.queryItems = [
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "redirect_uri", value: redirectUri),
            URLQueryItem(name: "scope", value: scope),
            URLQueryItem(name: "market", value: market),
            URLQueryItem(name: "locale", value: locale),
            URLQueryItem(name: "state", value: state),
            URLQueryItem(name: "iframe", value: String(iframe))
        ]

        return components.url
    }
}
