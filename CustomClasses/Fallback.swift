import UIKit

protocol ImageService {
    func loadItems(completion: @escaping (Result<UIImage, Error>) -> Void)
}

extension ImageService {
    func fallback(_ fallback: ImageService) -> ImageService {
        ImageServiceWithFallback(primary: self, fallback: fallback)
    }
    
    func retry(_ retyCount: UInt) -> ImageService {
        var service: ImageService = self
        for _ in 0..<retyCount {
            service = service.fallback(self)
        }
        return service
    }
}

// Composite
struct ImageServiceWithFallback: ImageService {
    let primary: ImageService
    let fallback: ImageService
    
    func loadItems(completion: @escaping (Result<UIImage, Error>) -> Void) {
        primary.loadItems { result in
            switch result {
            case.success:
                completion(result)
            case.failure:
                fallback.loadItems(completion: completion)
            }
        }
    }
}

struct InstaPickImageServiceAdapter: ImageService {
    let api: UIImageView
    let url: URL
    
    func loadItems(completion: @escaping (Result<UIImage, Error>) -> Void) {
        api.sd_setImage(with: url, completed: { (image, _, error, _) in
            if let image = image {
                completion(.success(image))
            } else {
                completion(.failure(ErrorResponse.string("instaPickImageNotFound")))
            }
        })
    }
}
