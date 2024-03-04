import UIKit

// Define a custom notification name for motion detection events
extension Notification.Name {
    static let motionDetected = Notification.Name("MotionDetectedNotification")
}

class MotionDetectionService {
    
    // Simulate motion detection by periodically posting a notification
    func simulateMotionDetection() {
        DispatchQueue.global().async {
            while true {
                // Simulate motion detection event
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    NotificationCenter.default.post(name: .motionDetected, object: nil)
                }
                // Sleep for a random interval (1-10 seconds) between motion detection events
                let randomInterval = Double.random(in: 1...10)
                Thread.sleep(forTimeInterval: randomInterval)
            }
        }
    }
}

class ViewController: UIViewController {
    
    let motionDetectionService = MotionDetectionService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start simulating motion detection
        motionDetectionService.simulateMotionDetection()
        
        // Observe motion detection notifications
        NotificationCenter.default.addObserver(self, selector: #selector(handleMotionDetection(_:)), name: .motionDetected, object: nil)
    }
    
    // Handle motion detection notifications
    @objc func handleMotionDetection(_ notification: Notification) {
        // Update UI or perform actions based on motion detection event
        print("Motion detected!")
        // You could display an alert to the user, update UI, or trigger other actions
    }
}
