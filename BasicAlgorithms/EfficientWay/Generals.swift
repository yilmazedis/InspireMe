// Bad way
analyzeButton.isHidden = selectedItems.count > 1 ? false : true

// Good way
analyzeButton.isHidden = selectedItems.count <= 1

/// ---------------------

func copyArrayExceptFirst<T>(_ array: [T]) -> [T] {
    return Array(array.dropFirst())
}
