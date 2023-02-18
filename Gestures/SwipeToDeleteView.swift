class SwipeToDeleteView: UIView {
    
    var deleteHandler: (() -> Void)?
    private let panGestureRecognizer = UIPanGestureRecognizer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGestureRecognizers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGestureRecognizers()
    }
    
    private func setupGestureRecognizers() {
        panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
        addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc private func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: self)
        
        switch gestureRecognizer.state {
        case .changed:
            transform = CGAffineTransform(translationX: translation.x, y: 0)
        case .ended:
            if translation.x < -bounds.size.width / 2 {
                deleteHandler?()
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.transform = .identity
                }
            }
        default:
            break
        }
    }
}



@objc private func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
    let translation = gestureRecognizer.translation(in: self.view)
    let location = gestureRecognizer.location(in: self.view)
    let convertedLocation =  tableView.convert(location, from: self.view)

    guard let cellPath = tableView.indexPathForRow(at: convertedLocation),
          let visibleCells = tableView.indexPathsForVisibleRows,
          let cell = tableView.cellForRow(at: visibleCells[cellPath.row]) else { return }

    switch gestureRecognizer.state {
        .....

    }
}
