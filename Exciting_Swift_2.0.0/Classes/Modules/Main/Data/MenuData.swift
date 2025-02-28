enum MenuData {
    case months, month(Month)
}

extension MenuData {
    enum Month: CaseIterable {
        case february

        var title: String {
            switch self {
            case .february:
                L10n.Month.february
            }
        }

        var data: [Сomplexity] {
            switch self {
            case .february:
                [.easy, .medium]
            }
        }
    }
    enum Сomplexity: CaseIterable {
        case easy, medium, hard

        var title: String {
            switch self {
            case .easy:
                L10n.Сomplexity.easy
            case .medium:
                L10n.Сomplexity.medium
            case .hard:
                L10n.Сomplexity.hard
            }
        }
    }

    func data<dataType>() -> [dataType] {
        switch self {
        case .months:
            Month.allCases as? [dataType] ?? []
        case let .month(month):
            month.data as? [dataType] ?? []
        }
    }

    var title: String {
        switch self {
        case .months:
            L10n.Menu.title
        case let .month(month):
            month.title
        }
    }
}
