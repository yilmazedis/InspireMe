// Bad way
analyzeButton.isHidden = selectedItems.count > 1 ? false : true

// Good way
analyzeButton.isHidden = selectedItems.count <= 1

/// ---------------------
func copyArrayExceptFirst<T>(_ array: [T]) -> [T] {
    return Array(array.dropFirst())
}

/// ---------------------
// Bad Case
var getAnyValidRemoteUrl: URL? {
    return previewUrl ?? thumnailUrl ?? downloadUrl ?? smalURl ?? mediumUrl ?? largeUrl 
}

// Better Case
var getAnyValidRemoteUrl: URL? {
    return [previewUrl, thumnailUrl, downloadUrl, smalURl, mediumUrl, largeUrl].compactMap({$0}).first
}
