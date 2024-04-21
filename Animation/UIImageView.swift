import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up an array of images to animate
        let images: [UIImage] = [
            UIImage(named: "image1")!,
            UIImage(named: "image2")!,
            UIImage(named: "image3")!
        ]
        
        // Assign the images to the animationImages property
        imageView.animationImages = images
        
        // Set animation duration and repeat count
        imageView.animationDuration = 1.0
        imageView.animationRepeatCount = 0 // 0 means repeat indefinitely
        
        // Start the animation
        imageView.startAnimating()
    }
}
