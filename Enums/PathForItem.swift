enum PathForItem: Equatable {
    
    case remoteUrl(URL?)
    
    case localMediaContent(LocalMediaContent)
    
    static func ==(lhs: PathForItem, rhs: PathForItem) -> Bool {
        switch (lhs, rhs) {
        case (let .remoteUrl(url1), let .remoteUrl(url2)): return url1 == url2
        case (let .localMediaContent(asset1), let .localMediaContent(asset2)): return asset1.urlToFile == asset2.urlToFile
        default:
            return false
        }
    }
}

var hasPreviewUrl: Bool {
    if case let PathForItem.remoteUrl(url) = patchToPreview, url != nil {
        return true
    }

    if case PathForItem.localMediaContent = patchToPreview {
        return true
    }

    return false
}
