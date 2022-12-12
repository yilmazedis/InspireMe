import UIKit

final class SnackbarView: UIView, NibInit {
    
    @IBOutlet weak var contentView: UIView! {
        willSet {
            newValue.backgroundColor = AppColor.snackbarBackground.color
            newValue.clipsToBounds = true
            newValue.layer.cornerRadius = 16
        }
    }
    
    @IBOutlet private weak var titleLabel: UILabel! {
        willSet {
            newValue.text = ""
            newValue.font = .appFont(.regular, size: 14)
            newValue.textColor = .white
            newValue.lineBreakMode = .byTruncatingTail
        }
    }
    
    @IBOutlet weak var actionButton: UIButton! {
        willSet {
            newValue.setBackgroundColor(.white, for: .normal)
            newValue.setTitleColor(AppColor.button.color, for: .normal)
            newValue.titleLabel?.font = UIFont.appFont(.medium, size: 16)
            newValue.isOpaque = true
            newValue.clipsToBounds = true
            newValue.layer.cornerRadius = 16
            newValue.isHidden = true
        }
    }
    
    static let shared = SnackbarView()
    
    private var action: VoidHandler?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func with(type: SnackbarType, message: String, actionTitle: String?, axis: NSLayoutConstraint.Axis, action: VoidHandler?) -> SnackbarView {
        let view = SnackbarView.initFromNib()
        
        view.titleLabel.numberOfLines = type.numberOfLinesLimit
        view.titleLabel.text = message
        
        if let actionTitle = actionTitle {
            view.actionButton.setTitle(actionTitle, for: .normal)
            view.action = action
            view.actionButton.isHidden = false
        }

        return view
    }

    @IBAction func onActionButtonTap(_ sender: Any) {
        action?()
    }
}
