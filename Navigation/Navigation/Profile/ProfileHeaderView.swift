//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by dmitriy on 8/6/2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
  lazy var avatarImageView: UIView = {
        let avatarImageView = UIView()
        avatarImageView.layer.cornerRadius = 60
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.backgroundColor = .white
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        
        return avatarImageView
    }()
    
    lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Snoop Dog"
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        fullNameLabel.textColor = UIColor.black
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return fullNameLabel
    }()
    
   lazy var imageViewSnoopDog: UIImageView = {
        let imageViewSnoopDog = UIImageView()
        imageViewSnoopDog.image = UIImage(named: "Snoop dog")
        imageViewSnoopDog.contentMode = .scaleAspectFill
        imageViewSnoopDog.clipsToBounds = true
        imageViewSnoopDog.translatesAutoresizingMaskIntoConstraints = false
        imageViewSnoopDog.layer.cornerRadius = avatarImageView.layer.cornerRadius
        imageViewSnoopDog.layer.borderColor = avatarImageView.layer.borderColor
        imageViewSnoopDog.layer.borderWidth = avatarImageView.layer.borderWidth
        
        return imageViewSnoopDog
    }()
    
   lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Write Your Status"
        statusLabel.textColor = UIColor.gray
        statusLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return statusLabel
    }()
    
  lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.backgroundColor = UIColor.white
        statusTextField.layer.cornerRadius = 12
        statusTextField.textColor = UIColor.black
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
    
  lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton(type: .system)
        setStatusButton.layer.cornerRadius = 8
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.tintColor = .white
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()
    
    var newButton: UIButton = {
        let newButton = UIButton(type: .system)
        newButton.setTitle("New Button", for: .normal)
        newButton.setTitleColor(.black, for: .normal)
        newButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        return newButton
    }()
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupContraints()
        addButtons()
    }
    
    func setupView() {
        
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(setStatusButton)
        self.addSubview(imageViewSnoopDog)
        self.addSubview(statusTextField)
        self.addSubview(newButton)
    }
    
     func addButtons() {
        setStatusButton.addTarget(self, action: #selector(printStatus), for: .touchUpInside)
    }
    
     func setupContraints() {
        
        NSLayoutConstraint.activate([
            
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            imageViewSnoopDog.topAnchor.constraint(equalTo: avatarImageView.topAnchor,constant: 0),
            imageViewSnoopDog.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor,constant: 0),
            imageViewSnoopDog.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 0),
            imageViewSnoopDog.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 0),
            imageViewSnoopDog.widthAnchor.constraint(equalToConstant: 120),
            imageViewSnoopDog.heightAnchor.constraint(equalToConstant: 120),
            
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27),
            fullNameLabel.widthAnchor.constraint(equalTo: widthAnchor),
            
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,constant: 27),
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -16),
            
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: setStatusButton.trailingAnchor),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            newButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
     @objc func printStatus() {
        statusLabel.text = statusTextField.text
        statusTextField.text = ""
    }
}
