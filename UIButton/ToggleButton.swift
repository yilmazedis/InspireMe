private lazy var showButton: UIButton = {
    let newValue = UIButton(type: .custom)
    newValue.titleLabel?.font = .appFont(.medium, size: 14)

    // normal
    newValue.setTitle(TextConstants.showMore, for: .normal)
    newValue.setTitleColor(ColorConstants.textGrayColor, for: .normal)
    newValue.setImage(Image.iconArrowDownSmall.image, for: .normal)

    // selected
    newValue.setTitle(TextConstants.showLess, for: .selected)
    newValue.setTitleColor(ColorConstants.textGrayColor, for: .selected)
    newValue.setImage(Image.iconArrowUpSmall.image, for: .selected)

    newValue.forceImageToRightSide()

    newValue.addTarget(self, action: #selector(onCollapseTap), for: .touchUpInside)
    return newValue
}()

@IBAction func toggleButtonAction(_ sender: UIButton) {
    sender.isSelected.toggle()
}


extension UIButton {
    /// https://stackoverflow.com/a/43785519/5893286
    func forceImageToRightSide() {
        /// or 1
        let newTransform = CGAffineTransform(scaleX: -1.0, y: 1.0) 
        transform = newTransform
        titleLabel?.transform = newTransform
        imageView?.transform = newTransform
        
        /// or 2
        //sortByButton.semanticContentAttribute = .forceRightToLeft
    }
}
