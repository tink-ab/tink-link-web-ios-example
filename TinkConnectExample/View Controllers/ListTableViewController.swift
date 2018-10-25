import UIKit

final class ListTableViewController: UITableViewController {
    var demoData: DemoData!

    private let formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = NSLocalizedString("Overview", comment: "")

        let accountCell = UINib(nibName: OverviewTableViewCell.identifier, bundle: nil)
        tableView.register(accountCell, forCellReuseIdentifier: OverviewTableViewCell.identifier)

        let investmentCell = UINib(nibName: InvestmentTableViewCell.identifier, bundle: nil)
        tableView.register(investmentCell, forCellReuseIdentifier: InvestmentTableViewCell.identifier)
    }
}

// MARK: - UITableViewSource

extension ListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return demoData.accountData.accounts.count
        case 1: return demoData.transactionData.results.count
        case 2: return demoData.investmentData.portfolios.first?.instruments.count ?? 0
        default: return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: return cellForAccount(tableView, indexPath: indexPath)
        case 1: return cellForTransaction(tableView, indexPath: indexPath)
        case 2: return cellForInvestment(tableView, indexPath: indexPath)
        default: fatalError()
        }
    }

    private func cellForAccount(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OverviewTableViewCell.identifier, for: indexPath) as? OverviewTableViewCell else {
            fatalError()
        }

        let account = demoData.accountData.accounts[indexPath.row]
        let currency = demoData.userData.profile.currency

        cell.titleLabel.text = account.name
        cell.descriptionLabel.text = account.accountNumber
        cell.amountLabel.text = "\(account.balance) \(currency)"

        switch account.type {
        case "CHECKING", "SAVINGS", "INVESTMENT", "PENSION":
            cell.iconImageView.image = UIImage(imageLiteralResourceName: "oval-green")
        case "MORTGAGE", "LOAN":
            cell.iconImageView.image = UIImage(imageLiteralResourceName: "oval-red")
        default:
            break
        }

        return cell
    }

    private func cellForTransaction(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OverviewTableViewCell.identifier, for: indexPath) as? OverviewTableViewCell else {
            fatalError()
        }

        let transaction = demoData.transactionData.results[indexPath.row].transaction
        let currency = demoData.userData.profile.currency

        cell.titleLabel.text = transaction.description
        cell.descriptionLabel.text = formatter.string(from: transaction.date)
        cell.amountLabel.text = "\(transaction.amount) \(currency)"

        switch transaction.categoryType {
        case "INCOME":
            cell.iconImageView.image = UIImage(imageLiteralResourceName: "transaction-income")
        case "EXPENSES":
            cell.iconImageView.image = UIImage(imageLiteralResourceName: "transaction-expense")
        case "TRANSFERS":
            cell.iconImageView.image = UIImage(imageLiteralResourceName: "transaction-transfer")
        default:
            break
        }

        return cell
    }

    private func cellForInvestment(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InvestmentTableViewCell.identifier, for: indexPath) as? InvestmentTableViewCell else {
            fatalError()
        }

        let instrument = demoData.investmentData.portfolios.first!.instruments[indexPath.row]
        let currency = instrument.currency

        cell.nameLabel.text = instrument.name
        cell.priceLabel.text = "\(instrument.price) \(currency)"
        cell.quantityLabel.text = "\(instrument.quantity)"
        cell.profitLabel.text = "\(instrument.profit) \(currency)"

        return cell
    }
}

// MARK: - UITableViewDelegate

extension ListTableViewController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return NSLocalizedString("Accounts", comment: "")
        case 1: return NSLocalizedString("Transactions", comment: "")
        case 2: return NSLocalizedString("Investment data", comment: "")
        default: return nil
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
