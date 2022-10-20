import UIKit

class SpringLabel: UILabel {
    
    lazy var duration = 0.1
    
    override var text: String? {
        didSet {
            UIView.animate(withDuration: duration) {
                self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }
            UIView.animate(withDuration: duration, delay: duration, options: [], animations: {
                self.transform = .identity
            }, completion: nil)
        }
    }
}
