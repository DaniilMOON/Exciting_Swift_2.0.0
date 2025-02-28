//
//  MainViewController.swift
//  Exciting_Swift_2.0.0
//
//  Created by Даниил Осипов on 28.02.2025.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = VCFactory.buildFebruaryEasyVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
