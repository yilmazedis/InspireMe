// https://stackoverflow.com/a/50603147/7657265

stackView.addArrangedSubview(subtitle)

// find length of label.
var rect: CGRect = subtitle.frame //get frame of label
rect.size = (subtitle.text?.size(withAttributes: [NSAttributedString.Key.font: UIFont(name: subtitle.font.fontName , size: subtitle.font.pointSize)!]))! //Calculate as per label font
subtitle.translatesAutoresizingMaskIntoConstraints = false
print("yilmaz \(rect.width)")
subtitle.trailingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -rect.width).isActive = true


func UILabelWidthBasedOnTextLength(with label: UILabel) -> CGFloat? {
    guard let text = label.text,
          let font = UIFont(name: label.font.fontName,
                            size: label.font.pointSize) else { return nil }

    var frame: CGRect = label.frame
    frame.size = text.size(withAttributes: [NSAttributedString.Key.font: font])
    return frame.width
}
