import Foundation

struct AuthorizationUrlBuilder {
    let clientId: String
    let redirectUri: URL
    let appUri: URL?
    let scope: String
    let market: String
    let locale: String
    let state: String?
    let iframe: Bool
    let test: Bool

    func build() -> URL? {
        guard let baseUrl = URL(string: Constants.tinkLinkUrl) else {
            fatalError("Invalid base URL")
        }

        guard var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false) else {
            fatalError("Invalid base URL")
        }

        components.queryItems = [
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "redirect_uri", value: redirectUri.absoluteString),
            URLQueryItem(name: "app_uri", value: appUri?.absoluteString),
            URLQueryItem(name: "scope", value: scope),
            URLQueryItem(name: "market", value: market),
            URLQueryItem(name: "locale", value: locale),
            URLQueryItem(name: "state", value: state),
            URLQueryItem(name: "iframe", value: String(iframe)),
            URLQueryItem(name: "test", value: String(test))
        ]

        return components.url
    }
}
