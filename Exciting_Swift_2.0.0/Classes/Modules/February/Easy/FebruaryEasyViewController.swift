import UIKit

final class FebruaryEasyViewController: UIViewController {
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
        title = "\(L10n.Month.february): \(L10n.Сomplexity.easy)"
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
        let starImageView = UIImageView(image: Asset.star.image)
        starImageView.contentMode = .scaleAspectFit
        starImageView.frame = star.bounds

        star.mask = starImageView
    }
}

