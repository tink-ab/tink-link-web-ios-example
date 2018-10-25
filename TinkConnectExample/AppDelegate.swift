import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        if url.host == "authorize" {
            if let components = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems,
                let code = components.first(where: { $0.name == "code" })?.value,
                let state = components.first(where: { $0.name == "state" })?.value {
                let notification = AccessCodeReceivedNotification(code: code, state: state)
                NotificationCenter.default.post(name: notification.name, object: nil, userInfo: notification.userInfo)
                return true
            }
        }

        return false
    }
}
