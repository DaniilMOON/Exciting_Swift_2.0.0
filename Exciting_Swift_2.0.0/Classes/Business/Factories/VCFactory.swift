import UIKit

enum VCFactory {
    static func buildMainVC(data: MenuData) -> UIViewController {
        let vc = StoryboardScene.Main.initialScene.instantiate()
        vc.addMenuData(data)
        return vc
    }

    static var buildFebruaryEasyVC: UIViewController {
        StoryboardScene.FebruaryEasy.initialScene.instantiate()
    }
}
