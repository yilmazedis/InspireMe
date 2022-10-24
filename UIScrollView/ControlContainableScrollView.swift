
final class ControlContainableScrollView: UIScrollView {
    override func touchesShouldCancel(in view: UIView) -> Bool {
        if view is UIControl
            && !(view is UITextInput)
            && !(view is UISlider)
            && !(view is UISwitch) {
            return true
        }
        return super.touchesShouldCancel(in: view)
    }
}

lazy var scrollView: ControlContainableScrollView = {
    let view = ControlContainableScrollView()
    view.delaysContentTouches = false
    return view
}()
