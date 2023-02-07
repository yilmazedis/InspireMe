import AVFoundation

extension URL {
    var videoThumbnail: UIImage? {
        let asset = AVURLAsset(url: self)
        let generator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true
        
        let timestamp = CMTime(seconds: 1, preferredTimescale: 60)
        
        do {
            let imageRef = try generator.copyCGImage(at: timestamp, actualTime: nil)
            return UIImage(cgImage: imageRef)
        } catch {
            return nil
        }
    }
}

extension URL {
    func videoThumbnail(defaultImage: UIImage) -> UIImage {
        let asset = AVURLAsset(url: self)
        
        let generator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true
        
        let timestamp = CMTime(seconds: 1, preferredTimescale: 60)
        
        guard let imageRef = try? generator.copyCGImage(at: timestamp, actualTime: nil) else { return defaultImage }
        return UIImage(cgImage: imageRef)
    }
}
