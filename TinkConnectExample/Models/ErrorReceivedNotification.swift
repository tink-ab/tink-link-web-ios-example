import Foundation

struct ErrorReceivedNotification {
    let name = NSNotification.Name.errorReceived
    let error: String

    init?(notification: Notification) {
        guard let error = notification.userInfo?["error"] as? String else {
            return nil
        }

        self.error = error
    }

    init(error: String) {
        self.error = error
    }

    var userInfo: [AnyHashable: Any] {
        return [
            "error": error
        ]
    }
}
