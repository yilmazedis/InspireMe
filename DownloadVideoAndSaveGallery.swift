
import UIKit
import Photos

class ImportViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func myButton(_ sender: Any) {
        
        let videoURL = "https://youerdomin.com/file.mp4"
        
        print("1")
        
        DispatchQueue.global(qos: .background).async {
            
            print("2")
            
            if let url = URL(string: videoURL), let urlData = NSData(contentsOf: url) {
                
                print("3")
                
                let documentsPath =
                NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
                
                let filePath="\(documentsPath)/tempFile.mp4"
                
                DispatchQueue.main.async {
                    
                    print("4")
                    
                    urlData.write(toFile: filePath, atomically: true)
                    
                    PHPhotoLibrary.shared().performChanges({
                        
                        print("5")
                        
                        PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: URL(fileURLWithPath: filePath))
                        
                    }) { completed, error in
                        
                        print("6")
                        
                        if completed {
                            
                            print("Video is saved!")
                            
                        }else{
                            
                            print("7: ",filePath)
                            
                        }
                    }
                }
            }else{
                
                print("8")
                
            }
        }
    }
}
