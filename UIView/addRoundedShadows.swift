extension UIView {
  func addRoundedShadows(cornerRadius: CGFloat,
                         shadowColor: CGColor,
                         opacity: Float,
                         radius: CGFloat,
                         offset: CGSize? = .zero) {
      layer.cornerRadius = cornerRadius
      layer.shadowColor = shadowColor
      layer.shadowOpacity = opacity
      layer.shadowOffset = offset ?? .zero
      layer.shadowRadius = radius
      layer.masksToBounds = false
  }
}
