enum AppImage {
    
    case iconLogo
    
    var image: UIImage {
        guard let image = UIImage(named: String(describing: self)) else {
            assertionFailure("Image not found with name: \(String(describing: self))")
            return UIImage()
        }

        return image
    }

    @available(iOS, deprecated: 13.0, message: "Use image(withTintColor:) once the minimum is updated to iOS 13")
    func image(withTintColor tintColor: AppColor, in view: UIView) -> UIImage {
        view.tintColor = tintColor.color
        return image.withRenderingMode(.alwaysTemplate)
    }

    @available(iOS 13.0, *)
    @available(iOSApplicationExtension 13.0, *)
    func image(withTintColor tintColor: AppColor) -> UIImage {
        return image.withTintColor(tintColor.color)
    }
}