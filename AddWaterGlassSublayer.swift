//
//  ViewController.swift
//  CustomViewWorking
//
//  Created by yilmaz on 17.08.2022.
//

import UIKit

class ViewController : UIViewController {
    
    lazy var label: UILabel = {
        var label = UILabel()
        label = UILabel()
        label.text = "Hello World!"
        label.textColor = .systemBlue
        return label
    }()
    
    lazy var button: UIButton = {
        var btn = UIButton(type: .system)
        btn.setTitle("Tap Me", for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 8
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(squareButtonTap), for: .touchUpInside)
        return btn
    }()
    
    lazy var contentView: UIView = {
        var contentView = UIView()
        contentView.backgroundColor = .green
        return contentView
    }()
    
    lazy var textField: UITextField = {
        var textField = UITextField()
        
        textField.placeholder = "Write Something"
        textField.textColor = .black
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 8
        
        return textField
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        contentView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.addWaterGlassSublayer(startPoint: CGPoint(x: 180, y: -10),
                                    height: 50,
                                    strokeColor: .systemOrange,
                                    fillColor: .clear,
                                    lineWidth: 2)
        
    }
    
    @objc func squareButtonTap() {
        label.isHidden = !label.isHidden
        print("label.isHidden \(label.isHidden)")
    }
}

extension UIView {
    // Draw a water glass shape, covers around view
    // Starts from right
    // *       S
    // *       *   ---> Water Glass :)
    // *       *
    //  *******
    // startPoint.x & height must me positive number
    func addWaterGlassSublayer(startPoint: CGPoint,
                               height: CGFloat,
                               strokeColor: UIColor,
                               fillColor: UIColor, lineWidth: CGFloat) {
        
        let path: UIBezierPath = getPath(startPoint: startPoint,
                                         height: height)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = lineWidth
        shape.strokeColor = strokeColor.cgColor
        shape.fillColor = fillColor.cgColor
        self.layer.addSublayer(shape)
    }
    
    private func getPath(startPoint: CGPoint, height: CGFloat) -> UIBezierPath {
        let path: UIBezierPath = UIBezierPath()
        let radius: CGFloat = 10
        
        // Right Top Corner
        path.move(to: startPoint)
        
        // Right Edge
        path.addLine(to: CGPoint(x: startPoint.x, y: height))
        
        // Right Bottom Curve
        path.addArc(withCenter: CGPoint(x: startPoint.x - radius, y: height), radius: radius, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi/2), clockwise: true)
        
        // Bottom Edge
        path.addLine(to: CGPoint(x: radius, y: height + radius))
        
        // Left Bottom Curve
        path.addArc(withCenter: CGPoint(x: radius, y: height), radius: radius, startAngle: CGFloat(Double.pi/2), endAngle: CGFloat(Double.pi), clockwise: true)
        
        // Left Edge
        path.addLine(to: CGPoint(x: 0, y: startPoint.y))
        return path
    }
}
