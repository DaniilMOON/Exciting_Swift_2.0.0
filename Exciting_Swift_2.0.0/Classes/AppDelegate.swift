//
//  AppDelegate.swift
//  Exciting_Swift_2.0.0
//
//  Created by Даниил Осипов on 26.02.2025.
//

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
        let mainView = VCFactory.buildMainVC()
        navigationController.viewControllers = [mainView]
        self.window!.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }
}

