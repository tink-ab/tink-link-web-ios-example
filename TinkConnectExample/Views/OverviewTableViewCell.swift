import UIKit

final class OverviewTableViewCell: UITableViewCell {
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()

        iconImageView.image = nil
    }
}
