import UIKit

class InstagramPickedImage: UIViewController {
    
    lazy var pickedLabel: UILabel = {
        let view = UILabel()
        view.text = "PICKED!"
        view.textColor = .white
        view.textAlignment = .center
        view.layer.cornerRadius = 6.7
        return view
    }()
    
    lazy var pickedLabelContainer: UIView = {
        let view = UIView(frame: CGRect(x: -5, y: -5, width: 80, height: 30))
        addGradient(to: view)
        view.layer.cornerRadius = 6.7
        view.layer.masksToBounds = true
         return view
     }()
    
    lazy var rateLabel: UILabel = {
        let view = UILabel()
        view.text = "4.5"
        view.textColor = .white
        view.textAlignment = .center
        view.layer.cornerRadius = 6.7
        return view
    }()
    
    lazy var rateContainer: UIView = {
        let view = UIView(frame: CGRect(x: -5, y: -5, width: 32, height: 32))
        addGradient(to: view)
        view.layer.cornerRadius = 6.7
        view.layer.masksToBounds = true
         return view
     }()
    
    lazy var selectedImageContainer: UIView = {
        let view = UIView(frame: CGRect(x: 5, y: 5, width: 165, height: 165))
        addGradient(to: view)
        view.layer.cornerRadius = 15.2
        view.layer.masksToBounds = true
         return view
     }()
    
    lazy var selectedImage: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "07")
        view.layer.cornerRadius = 15.2
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    lazy var container: UIView = {
        let view = UIView()
         return view
     }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        container.heightAnchor.constraint(equalToConstant: 160).isActive = true
        container.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        /// picked image
        container.addSubview(selectedImageContainer)
        selectedImageContainer.translatesAutoresizingMaskIntoConstraints = false
        selectedImageContainer.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        selectedImageContainer.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        selectedImageContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        selectedImageContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        
        selectedImageContainer.addSubview(selectedImage)
        selectedImage.translatesAutoresizingMaskIntoConstraints = false
        selectedImage.topAnchor.constraint(equalTo: selectedImageContainer.topAnchor, constant: 2).isActive = true
        selectedImage.bottomAnchor.constraint(equalTo: selectedImageContainer.bottomAnchor, constant: -2).isActive = true
        selectedImage.trailingAnchor.constraint(equalTo: selectedImageContainer.trailingAnchor, constant: -2).isActive = true
        selectedImage.leadingAnchor.constraint(equalTo: selectedImageContainer.leadingAnchor, constant: 2).isActive = true
        
        /// picked label
        container.addSubview(pickedLabelContainer)
        pickedLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        pickedLabelContainer.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 15).isActive = true
        pickedLabelContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pickedLabelContainer.widthAnchor.constraint(equalToConstant: 80).isActive = true
        pickedLabelContainer.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        
        pickedLabelContainer.addSubview(pickedLabel)
        pickedLabel.translatesAutoresizingMaskIntoConstraints = false
        pickedLabel.topAnchor.constraint(equalTo: pickedLabelContainer.topAnchor).isActive = true
        pickedLabel.bottomAnchor.constraint(equalTo: pickedLabelContainer.bottomAnchor).isActive = true
        pickedLabel.trailingAnchor.constraint(equalTo: pickedLabelContainer.trailingAnchor).isActive = true
        pickedLabel.leadingAnchor.constraint(equalTo: pickedLabelContainer.leadingAnchor).isActive = true
        
        /// rate label
        container.addSubview(rateContainer)
        rateContainer.translatesAutoresizingMaskIntoConstraints = false
        rateContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 16).isActive = true
        rateContainer.heightAnchor.constraint(equalToConstant: 32).isActive = true
        rateContainer.widthAnchor.constraint(equalToConstant: 32).isActive = true
        rateContainer.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        
        rateContainer.addSubview(rateLabel)
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        rateLabel.topAnchor.constraint(equalTo: rateContainer.topAnchor).isActive = true
        rateLabel.bottomAnchor.constraint(equalTo: rateContainer.bottomAnchor).isActive = true
        rateLabel.trailingAnchor.constraint(equalTo: rateContainer.trailingAnchor).isActive = true
        rateLabel.leadingAnchor.constraint(equalTo: rateContainer.leadingAnchor).isActive = true
    }
    
    func addGradient(to view: UIView) {
        let gradient: CAGradientLayer = CAGradientLayer()
    
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
           
        gradient.colors = [colorTop, colorBottom]
        gradient.frame = view.bounds
        gradient.shouldRasterize = true
        view.layer.insertSublayer(gradient, at: 0)
    }
}

