import UIKit

extension UIView {    
    static func makeSpacing(width: CGFloat, height: CGFloat) -> UIView {
        let view = UIView()
        view.backgroundColor = AppColor.background.color
        view.widthAnchor.constraint(equalToConstant: width).isActive = true
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        return view
    }
}
