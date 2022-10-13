extension NSNotification.Name {
    static let hideSignIn = Notification.Name(rawValue: "hideSignIn")
    static let showSignIn = Notification.Name(rawValue: "showSignIn")
}

NotificationCenter.default.addObserver(self, selector: #selector(hideSignInScreen), name: .hideSignIn, object: nil)
NotificationCenter.default.post(name: .hideSignIn, object: nil)
