    let containerView: UIView = {
        let screenSize: CGRect = UIScreen.main.bounds
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 180))
        view.backgroundColor = UIColor(white: 1, alpha: 0)
        view.clipsToBounds = false
        return view
    }()
    
    
   func addGradient(to view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.layer.bounds;
        gradientLayer.colors = [AppColor.premiumThirdGradient.cgColor,
                                AppColor.premiumSecondGradient.cgColor,
                                AppColor.premiumFirstGradient.cgColor]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        view.layer.insertSublayer(gradientLayer, at: 0);
    }
