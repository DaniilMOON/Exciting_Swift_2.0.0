import UIKit

final class MainViewController: UIViewController {

    private(set) var menuData = [MenuVM]()

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
    }

    // MARK: Configurations

    private func configuration() {
        collectionView.collectionViewLayout = createLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            UINib(nibName: MenuCell.reuseIdentifier, bundle: nil),
            forCellWithReuseIdentifier: MenuCell.reuseIdentifier
        )
    }

    // MARK: Outlet

    @IBOutlet var collectionView: UICollectionView!

    // MARK: AddData

    func addMenuData(_ data: MenuData) {
        title = data.title
        switch data {
        case .months:
            let months: [MenuData.Month] = data.data()
            menuData = months.map {
                let vc = VCFactory.buildMainVC(data: .month($0))
                return .init(title: $0.title) {
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        case let .month(month):
            let complexities: [MenuData.Сomplexity] = month.data
            menuData = complexities.compactMap {
                switch $0 {
                case .easy:
                    let vc = VCFactory.buildFebruaryEasyVC
                    return .init(title: $0.title) {
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                case .medium:
                    return nil
                case .hard:
                    return nil
                }
            }
        }
    }

    // MARK: Private

    private func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(16)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let section = NSCollectionLayoutSection(group: .horizontal(layoutSize: itemSize, subitems: [item]))
            return section
        }
    }
}

// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        menuData[indexPath.item].didSelect?()

    }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        menuData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MenuCell.reuseIdentifier,
            for: indexPath
        ) as? MenuCell else {
            return UICollectionViewCell()
        }
        let viewModel = menuData[indexPath.item]
        cell.update(with: viewModel)
        return cell
    }
}
