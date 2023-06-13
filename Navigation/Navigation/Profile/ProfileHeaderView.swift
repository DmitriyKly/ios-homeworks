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
        return imageViewSnoopDog
    }()
    
    lazy var statusLabel: UITextField = {
        let statusLabel = UITextField()
        statusLabel.text = "Write Your Status"
        statusLabel.textColor = UIColor.gray
        statusLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
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
    }
    
    func addButtons() {
        setStatusButton.addTarget(self, action: #selector(printStatus), for: .touchUpInside)
    }
    
    func setupContraints() {
    

        NSLayoutConstraint.activate([
            
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            
            imageViewSnoopDog.topAnchor.constraint(equalTo: avatarImageView.topAnchor,constant: 0),
            imageViewSnoopDog.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor,constant: 0),
            imageViewSnoopDog.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 0),
            imageViewSnoopDog.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 0),
            imageViewSnoopDog.widthAnchor.constraint(equalToConstant: 120),
            imageViewSnoopDog.heightAnchor.constraint(equalToConstant: 120),
            
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,constant: 27),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor,constant: -34),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)

        ])
        
    }
    
    @objc func printStatus() {
        let printText = "\(statusLabel.text ?? "Nil")"
        print(printText)
    }
    
}
