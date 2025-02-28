import UIKit

final class MenuCell: UICollectionViewCell {
    static let reuseIdentifier = "MenuCell"

    // MARK: Initialization

    override func awakeFromNib() {
        super.awakeFromNib()

        configure()
    }

    // MARK: Life cycle

    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)

        if state.isHighlighted {
            backgroundConfiguration?.backgroundColor = .systemGray6
        } else {
            backgroundConfiguration?.backgroundColor = .systemBackground
        }
    }

    // MARK: Configuration

    private func configure() {
        backgroundConfiguration = .clear()
    }

    // MARK: Outlet

    @IBOutlet weak var titleLabel: UILabel!

    // MARK: Update cell

    func update(with model: MenuVM) {
        titleLabel.text = model.title
    }
}
