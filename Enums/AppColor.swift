enum AppColor {

    // Colors
    case buttonBackground
  
    var color: UIColor {
        guard let uiColor = UIColor(named: String(describing: self)) else {
            assertionFailure("Color not found with name: \(self)")
            return UIColor()
        }
        return uiColor
    }

    var cgColor: CGColor {
        return color.cgColor
    }

    func withAlphaComponent(_ alpha: CGFloat) -> UIColor {
        return color.withAlphaComponent(alpha)
    }
}
