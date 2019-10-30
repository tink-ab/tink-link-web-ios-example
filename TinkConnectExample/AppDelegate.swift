import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        if url.host == "authorize" {
            guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
                let queryItems = components.queryItems else {
                return true
            }

            if let code = queryItems.first(where: { $0.name == "code" })?.value,
                let state = queryItems.first(where: { $0.name == "state" })?.value {
                let notification = AccessCodeReceivedNotification(code: code, state: state)
                NotificationCenter.default.post(name: notification.name, object: nil, userInfo: notification.userInfo)
                return true
            }

            if let error = queryItems.first(where: { $0.name == "error" })?.value, !error.isEmpty {
                let notification = ErrorReceivedNotification(error: error)
                NotificationCenter.default.post(name: notification.name, object: nil, userInfo: notification.userInfo)
                return true
            }
        }

        return false
    }
}
