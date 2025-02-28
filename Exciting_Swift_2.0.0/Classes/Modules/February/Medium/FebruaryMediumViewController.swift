import UIKit

final class FebruaryMediumViewController: UIViewController {
    // MARK: Properties

    private let cellData: [[ColorVM]] = [
        [
            .init(color: .red),
            .init(color: .orange),
            .init(color: .yellow),
            .init(color: .green),
            .init(color: .blue)
        ],
        [
            .init(color: .blue),
            .init(color: .green),
            .init(color: .yellow),
            .init(color: .orange),
            .init(color: .red)
        ]
    ]

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
    }

    // MARK: Configurations

    private func configuration() {
        title = "\(L10n.Month.february): \(L10n.Сomplexity.medium)"

        let layout = createLayout()
        layout.register(SectionBackgroundView.self, forDecorationViewOfKind: SectionBackgroundView.elementKind)
        collectionView.collectionViewLayout = layout
        collectionView.showsVerticalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.dataSource = self
        collectionView.register(ColorCell.self, forCellWithReuseIdentifier: ColorCell.reuseIdentifier)
    }

    // MARK: Outlet

    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: Private

    private func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let width = (layoutEnvironment.container.contentSize.width - 48) * 3 / 4
            let height = width / 4
            let backgroundHeight = layoutEnvironment.container.contentSize.width * 3 / 2
            let size = NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .absolute(height))
            let item = NSCollectionLayoutItem(layoutSize: size)

            let section = NSCollectionLayoutSection(group: .horizontal(layoutSize: size, subitems: [item]))
            section.interGroupSpacing = 12
            section.contentInsets = NSDirectionalEdgeInsets(
                top: backgroundHeight - height - 8 + 20,
                leading: 8,
                bottom: 8,
                trailing: 8
            )
            section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary

            let backgroundItem = NSCollectionLayoutDecorationItem
                .background(elementKind: SectionBackgroundView.elementKind)
            backgroundItem.contentInsets = .init(top: 20, leading: 0, bottom: 0, trailing: 0)
            section.decorationItems = [backgroundItem]

            return section
        }
    }
}

// MARK: - UICollectionViewDataSource

extension FebruaryMediumViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        cellData.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellData[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ColorCell.reuseIdentifier,
            for: indexPath
        ) as? ColorCell else {
            return UICollectionViewCell()
        }
        let viewModel = cellData[indexPath.section][indexPath.item]
        cell.update(with: viewModel)
        return cell
    }
}


