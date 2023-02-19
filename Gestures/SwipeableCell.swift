import UIKit
import SDWebImage

class SwipeableCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .label
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.textColor = .label
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    private lazy var infoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.image = .checkmark
        view.layer.cornerRadius = 6
        
        return view
    }()
    
    private lazy var checkBox: UIButton = {
        let view = UIButton()
        
        view.isHidden = true
        
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.blue.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    private lazy var underContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .red
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    var deleteHandler: (() -> Void)?
    private let panGestureRecognizer = UIPanGestureRecognizer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setupGestureRecognizers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setLayout()
        setupGestureRecognizers()
    }
    
    private func setupGestureRecognizers() {
        
        panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
        panGestureRecognizer.delegate = self
        contentView.addGestureRecognizer(panGestureRecognizer)
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if (gestureRecognizer.isKind(of: UIPanGestureRecognizer.self)) {
            let t = (gestureRecognizer as! UIPanGestureRecognizer).translation(in: contentView)
            let verticalness = abs(t.y)
            if (verticalness > 0) {
                print("ignore vertical motion in the pan ...")
                print("the event engine will >pass on the gesture< to the scroll view")
                return false
            }
        }
        return true
    }
    
    @objc private func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: containerView)
        
        switch gestureRecognizer.state {
        case .changed:
            // Prevent it from sliding to the right
            guard translation.x < 0 else { return }
            
            containerView.transform = CGAffineTransform(translationX: translation.x , y: 0)
        case .ended:
            if translation.x < -containerView.bounds.size.width / 2 {
                deleteHandler?()
                UIView.animate(withDuration: 0.2) {
                    self.containerView.transform = .identity
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.containerView.transform = .identity
                }
            }
        default:
            break
        }
    }
    
    private func setLayout() {
        
        addSubview(underContainerView)
        underContainerView.translatesAutoresizingMaskIntoConstraints = false
        underContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        underContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        underContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6).isActive = true
        underContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        underContainerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 76).isActive = true
        
        /// Container Layout
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 76).isActive = true
        
        /// infoImageView Layout
        containerView.addSubview(infoImageView)
        infoImageView.translatesAutoresizingMaskIntoConstraints = false
        infoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        infoImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        infoImageView.widthAnchor.constraint(equalToConstant: 44).activate()
        infoImageView.heightAnchor.constraint(equalToConstant: 44).activate()
        
        containerView.addSubview(checkBox)
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        checkBox.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        checkBox.widthAnchor.constraint(equalToConstant: 24).isActive = true
        checkBox.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        containerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: infoImageView.trailingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: checkBox.leadingAnchor, constant: -16).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 24).activate()
        
        containerView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: infoImageView.trailingAnchor, constant: 16).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
    }
    
    func configure(model: YourModel, readMode: Bool) {
        titleLabel.text = "yilmaz"
        descriptionLabel.text = "Lorem ıpsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temp..Lorem ıpsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temp..Lorem ıpsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temp..Lorem ıpsum dolor sit amet"
        infoImageView.sd_setImage(with: URL(string: "https://avatars.githubusercontent.com/u/15719990?s=400&u=766c3d645df09b0c562e71affd899b296aa1d59b&v=4")!)
        
        checkBox.isHidden = !readMode
    }
}

// you may need these statements.
cell.deleteHandler = { [weak self] in
    self?.deleteNotification(tableView: tableView, cell: cell)
}

private func deleteNotification(tableView: UITableView, cell: NotificationTableViewCell) {
    let row = tableView.indexPath(for: cell)
    output.deleteNotification(at: row?.row ?? 0)
    let indexPath = IndexPath(item: row?.row ?? 0, section: 0)
    tableView.deleteRows(at: [indexPath], with: .fade)
}
