import UIKit

final class SectionBackgroundView: UICollectionReusableView {
    static let elementKind = "SectionBackgroundView"
    
    // MARK: Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        сonfiguration()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configuration

    private func сonfiguration() {
        backgroundColor = .gray
        layer.cornerRadius = 6
    }
}
