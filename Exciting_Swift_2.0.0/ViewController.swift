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
            drawStar(alignment: .horizontal, star: horizontalStar)
            drawStar(alignment: .vertical, star: verticalStar)
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

        maskForStar(star: horizontalStar)
        maskForStar(star: verticalStar)

        drawStar(alignment: .horizontal, star: horizontalStar)
        drawStar(alignment: .vertical, star: verticalStar)
    }

    // MARK: Action

    @IBAction func sliderMove(_ sender: UISlider) {
        sliderValue = Int(round(sender.value))
    }

    // MARK: Outlet

    @IBOutlet weak var horizontalStar: UIView!
    @IBOutlet weak var verticalStar: UIView!
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var valueLabel: UILabel!

    // MARK: Private

    private enum Alignment {
        case horizontal, vertical
    }

    private func drawStar(alignment: Alignment, star: UIView) {
        let (parts, colors) = switch alignment {
        case .horizontal:
            ([CGFloat(sliderValue) / 100, CGFloat(100 - sliderValue) / 100], colors)
        case .vertical:
            ([CGFloat(100 - sliderValue) / 100, CGFloat(sliderValue) / 100], colors.reversed())
        }
        var point: CGPoint = .zero

        let renderer = UIGraphicsImageRenderer(size: horizontalStar.bounds.size)
        let patternImage = renderer.image { context in
            zip(colors, parts).forEach { color, part in
                var size = self.horizontalStar.bounds.size
                switch alignment {
                case .horizontal:
                    size.width *= part
                case .vertical:
                    size.height *= part
                }

                color.setFill()
                context.fill(CGRect(origin: point, size: size))
                switch alignment {
                case .horizontal:
                    point.x += horizontalStar.bounds.width * part
                case .vertical:
                    point.y += horizontalStar.bounds.width * part
                }

            }
        }
        star.backgroundColor = UIColor(patternImage: patternImage)
    }

    private func maskForStar(star: UIView) {
        let starImageView = UIImageView(image: .star)
        starImageView.contentMode = .scaleAspectFit
        starImageView.frame = star.bounds

        star.mask = starImageView
    }
}

