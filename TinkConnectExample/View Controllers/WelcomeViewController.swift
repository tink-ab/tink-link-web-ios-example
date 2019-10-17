import SafariServices
import UIKit

final class WelcomeViewController: UIViewController {
    private let marketPickerDataSource = ArrayPickerViewDataSource(data: ["AT", "BE", "DE", "DK", "ES", "FI", "GB", "NL", "NO", "SE"])
    private let localePickerDataSource = ArrayPickerViewDataSource(data: ["en_US", "sv_SE", "da_DK", "no_NO", "nl_NL", "fi_FI", "de_DE", "es_ES", "fr_FR"])
    private var state: String?
    private var demoResponse: DemoResponse?

    @IBOutlet private var marketPicker: UIPickerView! {
        didSet {
            marketPicker.delegate = marketPickerDataSource
        }
    }

    @IBOutlet private var languagePicker: UIPickerView! {
        didSet {
            languagePicker.delegate = localePickerDataSource
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(accessCodeReceived(_:)), name: .accessCodeReceived, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = nil
    }

    @IBAction private func submit(_ sender: Any) {
        submit()
    }

    private func submit() {
        state = UUID().uuidString

        let market = marketPickerDataSource.string(at: marketPicker.selectedRow(inComponent: 0))
        let locale = localePickerDataSource.string(at: languagePicker.selectedRow(inComponent: 0))

        guard let authenticationUrl = AuthorizationUrlBuilder(clientId: Constants.clientId, redirectUri: Constants.redirectUri, appUri: Constants.appUri, scope: Constants.scope, market: market, locale: locale, state: state, iframe: false, test: false).build() else {
            return print("Error: Couldn't build authentication URL")
        }

        let viewController = SFSafariViewController(url: authenticationUrl)
        present(viewController, animated: true, completion: nil)
    }
}

// MARK: - Navigation

extension WelcomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowList", let viewController = segue.destination as? ListTableViewController {
            viewController.demoData = demoResponse?.response
        }
    }

    private func showList(demoResponse: DemoResponse) {
        self.demoResponse = demoResponse
        performSegue(withIdentifier: "ShowList", sender: self)
    }
}

// MARK: - Notification

private extension WelcomeViewController {
    @objc private func accessCodeReceived(_ notification: Notification) {
        let authorizationCodeNotification = AccessCodeReceivedNotification(notification: notification)

        guard let code = authorizationCodeNotification?.code else {
            return print("Error: Couldn't extract code")
        }

        guard let state = authorizationCodeNotification?.state else {
            return print("Error: Couldn't extract state")
        }

        guard state == self.state else {
            dismiss(animated: true)
            return print("Error: State mismatch")
        }

        print("Received code '\(code)' and state '\(state)'")

        let client = Client()
        client.getDemoData(code: code) { [weak self] data, _, _ in
            DispatchQueue.main.async {
                self?.dismiss(animated: true) {
                    if let data = data {
                        self?.showList(demoResponse: data)
                    } else {
                        print("Error: No demo data was returned. Is the development server running on '\(Constants.demoDataUrl)'?")
                    }
                }
            }
        }
    }
}
