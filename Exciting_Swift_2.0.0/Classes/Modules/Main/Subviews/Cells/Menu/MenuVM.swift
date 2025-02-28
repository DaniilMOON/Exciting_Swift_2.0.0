import Foundation

final class MenuVM {
    // MARK: Properties

    let title: String
    let didSelect: (() -> Void)?

    // MARK: Initialization

    init(title: String, didSelect: @escaping () -> Void) {
        self.title = title
        self.didSelect = didSelect
    }

}
