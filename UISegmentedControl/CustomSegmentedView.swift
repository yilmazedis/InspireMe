import UIKit

class CustomSegmentedView: UIView {
    
    var action: IntHandler?
    private var buttons = [InsetsButton]()
    
    lazy var stackView: UIStackView = {
        let newValue = UIStackView()
        newValue.spacing = 8
        newValue.axis = .horizontal
        newValue.alignment = .fill
        newValue.distribution = .fillEqually
        newValue.isOpaque = true
        return newValue
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
    }
    
    private func initialSetup() {
        setupStackView()
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func insertSegment(withTitle title: String, tag: Int, width: CGFloat) {
        let segmentButton = getSegmentButton(withTitle: title, tag: tag)
        let shadowView = getShadowView()
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.widthAnchor.constraint(equalToConstant: width).activate()
        
        shadowView.addSubview(segmentButton)
        segmentButton.translatesAutoresizingMaskIntoConstraints = false
        segmentButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        segmentButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        segmentButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        segmentButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        buttons.append(segmentButton)
        stackView.addArrangedSubview(shadowView)
    }
    
    private func getShadowView() -> UIView {
        let view = UIView()
        view.addRoundedShadows(cornerRadius: 12, shadowColor: AppColor.drawerShadow.cgColor, opacity: 0.3, radius: 4)
        return view
    }
    
    private func getSegmentButton(withTitle title: String, tag: Int) -> InsetsButton {
        let button = InsetsButton()
        button.setTitle(title, for: .normal)
        button.tag = tag
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .appFont(.medium, size: 16)
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        action?(sender.tag)
        renderSegmentButtons(segment: sender.tag)
    }
    
    func renderSegmentButtons(segment: Int) {
        for el in buttons {
            if el.tag == segment {
                el.setBackgroundColor(AppColor.tint.color, for: .normal)
                el.setTitleColor(.white, for: .normal)
            } else {
                el.setBackgroundColor(AppColor.tertiaryBackground.color, for: .normal)
                el.setTitleColor(AppColor.label.color, for: .normal)
            }
        }
    }
}
