// Bad way
analyzeButton.isHidden = selectedItems.count > 1 ? false : true

// Good way
analyzeButton.isHidden = selectedItems.count <= 1

/// ---------------------
