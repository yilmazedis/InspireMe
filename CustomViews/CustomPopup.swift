//
//  ViewController.swift
//  ExampleProject
//
//  Created by yilmaz edis on 20.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .white
        sv.layer.cornerRadius = 16
        sv.clipsToBounds = true
        sv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return sv
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Analyze with Nunc quis ligula!"
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    lazy var subtitleLabel: UILabel = {
        let view = UILabel()
        view.text = "Nunc quis ligula nec nunc accumsan pulvinar at non eros. Sed ullamcorper nisi cursus aliquam vehicula. Nulla faucibus leo odio, ornare fermentum tellus accumsan vitae. Integer faucibus porttitor lobortis."
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse at magna lorem. Morbi volutpat tincidunt augue, quis facilisis velit vulputate sit amet. Nulla sollicitudin est sed magna pharetra iaculis. Maecenas libero metus, suscipit in erat vulputate, imperdiet luctus augue. Aliquam dictum sed sem euismod ornare. Nulla facilisi. Proin sed risus nec dui sagittis hendrerit. Nullam finibus neque in scelerisque posuere. Vestibulum condimentum facilisis diam sit amet tempor. Etiam eget felis odio."
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    lazy var withoutConnectingButton: UIButton = {
        let view = UIButton()
        view.setTitle("Connect with Instagram", for: .normal)
        view.backgroundColor = .systemBlue
        return view
    }()
    
    lazy var withConnectingButton: UIButton = {
        let view = UIButton()
        view.setTitle("Continue without connecting", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        return view
    }()
    
    lazy var checkBoxStackView: UIStackView = {
        let view = UIStackView()
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 16
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var checkBoxButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "checkmark"), for: .normal)
        view.setImage(UIImage(systemName: "person"), for: .selected)
        view.tintColor = .black
        return view
    }()
    
    lazy var checkBoxLabel: UILabel = {
        let view = UILabel()
        view.text = "Don’t show this again"
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    lazy var closeButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "clear"), for: .normal)
        view.tintColor = .black
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.5)
        setLayout()
    }
    
    
    func setLayout() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60).isActive = true
        
        contentView.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60).isActive = true
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 24).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60).isActive = true
        
        contentView.addSubview(withoutConnectingButton)
        withoutConnectingButton.translatesAutoresizingMaskIntoConstraints = false
        withoutConnectingButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40).isActive = true
        withoutConnectingButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        withoutConnectingButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        withoutConnectingButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        contentView.addSubview(withConnectingButton)
        withConnectingButton.translatesAutoresizingMaskIntoConstraints = false
        withConnectingButton.topAnchor.constraint(equalTo: withoutConnectingButton.bottomAnchor, constant: 40).isActive = true
        withConnectingButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        withConnectingButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        contentView.addSubview(checkBoxStackView)
        checkBoxStackView.translatesAutoresizingMaskIntoConstraints = false
        checkBoxStackView.topAnchor.constraint(equalTo: withConnectingButton.bottomAnchor, constant: 81).isActive = true
        
        checkBoxStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        checkBoxStackView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        checkBoxStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -40).isActive = true
        
        checkBoxStackView.addArrangedSubview(checkBoxButton)
        checkBoxStackView.addArrangedSubview(checkBoxLabel)
        
        contentView.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
    }
}

