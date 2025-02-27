//
//  ViewController.swift
//  Exciting_Swift_2.0.0
//
//  Created by Даниил Осипов on 26.02.2025.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties

    private var sliderValue = 20 {
        didSet {
            valueLabel.text = "\(sliderValue)%"
            widthHighlightedStar.constant = horizontalStar.bounds.width * CGFloat(sliderValue) / 100
            heightHighlightedStar.constant = verticalStar.bounds.height * CGFloat(sliderValue) / 100
        }
    }
    private let colors: [UIColor] = [.red, .gray]

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
    }

    // MARK: Configurations

    private func configuration() {
        valueLabel.text = "\(sliderValue)%"
        widthHighlightedStar.constant = horizontalStar.bounds.width * CGFloat(sliderValue) / 100
        heightHighlightedStar.constant = verticalStar.bounds.height * CGFloat(sliderValue) / 100

        maskForStar(star: horizontalStar)
        maskForStar(star: verticalStar)
    }

    // MARK: Action

    @IBAction func sliderMove(_ sender: UISlider) {
        sliderValue = Int(round(sender.value))
    }

    // MARK: Outlet

    @IBOutlet weak var widthHighlightedStar: NSLayoutConstraint!
    @IBOutlet weak var horizontalStar: UIView!
    @IBOutlet weak var heightHighlightedStar: NSLayoutConstraint!
    @IBOutlet weak var verticalStar: UIView!
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var valueLabel: UILabel!

    // MARK: Private

    private enum Alignment {
        case horizontal, vertical
    }

    private func maskForStar(star: UIView) {
        let starImageView = UIImageView(image: .star)
        starImageView.contentMode = .scaleAspectFit
        starImageView.frame = star.bounds

        star.mask = starImageView
    }
}

