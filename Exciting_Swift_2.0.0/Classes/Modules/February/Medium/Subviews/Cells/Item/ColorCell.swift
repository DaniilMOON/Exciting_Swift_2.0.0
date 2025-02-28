import UIKit

final class ColorCell: UICollectionViewCell {
    static let reuseIdentifier = "ColorCell"

    // MARK: Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configuration

    private func configure() {
        backgroundConfiguration = .clear()

        layer.cornerRadius = 6
        clipsToBounds = true
    }

    // MARK: CollectionCell

    func update(with model: ColorVM) {
        backgroundConfiguration?.backgroundColor = model.color
    }
}
