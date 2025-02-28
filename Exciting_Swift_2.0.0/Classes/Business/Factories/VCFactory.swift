//
//  VCFactory.swift
//  Exciting_Swift_2.0.0
//
//  Created by Даниил Осипов on 28.02.2025.
//

import UIKit

enum VCFactory {
    static func buildMainVC() -> UIViewController {
        StoryboardScene.Main.initialScene.instantiate()
    }

    static var buildFebruaryEasyVC: UIViewController {
        StoryboardScene.FebruaryEasy.initialScene.instantiate()
    }
}
