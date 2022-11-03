extension UIApplication {
    
    class func topController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topController(controller: selected)
            }
        }
        // checking !presented.isBeingDismissed
        // for cases where we're presenting while the top view controller is being dimissed
        // example for this is in
        // Gallery screen --> select photos --> three dots button --> share --> copy public link
        if let presented = controller?.presentedViewController, !presented.isBeingDismissed {
            return topController(controller: presented)
        }
        return controller
    }
}
