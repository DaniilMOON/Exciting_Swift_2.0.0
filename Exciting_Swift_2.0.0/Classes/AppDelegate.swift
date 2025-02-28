import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        let mainVС = VCFactory.buildMainVC(data: .months)
        navigationController.viewControllers = [mainVС]
        self.window!.rootViewController = navigationController
        self.window?.makeKeyAndVisible()

        UINavigationBar.appearance().tintColor = .black

        return true
    }
}

