
@IBOutlet weak var sharedSegmentControl: UISegmentedControl! {
    willSet {
        newValue.clipsToBounds = false
        newValue.setTitle(TextConstants.privateShareSharedWithMeTab, forSegmentAt: 0)
        newValue.setTitle(TextConstants.privateShareSharedByMeTab, forSegmentAt: 1)
        newValue.backgroundColor = .clear
        newValue.tintColor = .clear
        newValue.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        newValue.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        newValue.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.appFont(.medium, size: 14)],
                                                    for: .normal)
        newValue.setTitleTextAttributes([.foregroundColor: AppColor.filesLabel.color], for: .normal)
    }
}
