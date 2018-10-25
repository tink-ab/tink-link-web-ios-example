import Foundation

struct AccessCodeReceivedNotification {
    let name = NSNotification.Name.accessCodeReceived
    let code: String
    let state: String?

    init?(notification: Notification) {
        guard let code = notification.userInfo?["code"] as? String else {
            return nil
        }

        self.code = code
        state = notification.userInfo?["state"] as? String
    }

    init(code: String, state: String?) {
        self.code = code
        self.state = state
    }

    var userInfo: [AnyHashable: Any] {
        return [
            "code": code,
            "state": state as Any
        ]
    }
}
