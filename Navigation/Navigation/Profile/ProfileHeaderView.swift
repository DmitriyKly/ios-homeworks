//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by dmitriy on 8/6/2023.
//

import UIKit

class ProfileHeaderView: UIView {
    let profileHeader: UIView
    
    lazy var avatarImageView: UIView = {
        let avatar = UIView()
        // avatar.frame = CGRect(x: 16.0, y: 16.0, width: 150, height: 150)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.layer.cornerRadius = avatar.frame.height/2
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.borderWidth = 3
        return avatar
    }()
    
    
    
    lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Snoop Dog"
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        fullNameLabel.textColor = UIColor.black
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        // name.frame = CGRect(x: avatar.frame.maxX + 15.0 , y: 27.0, width: 100 , height: 20)
        return fullNameLabel
    }()
    
    lazy var imageViewSnoopDog: UIImageView = {
        imageViewSnoopDog = UIImageView()
        imageViewSnoopDog.image = UIImage(named: "Snoop dog")
        imageViewSnoopDog.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        imageViewSnoopDog.contentMode = .scaleAspectFit
        imageViewSnoopDog.clipsToBounds = true
        imageViewSnoopDog.layer.cornerRadius = avatarImageView.layer.cornerRadius
        imageViewSnoopDog.translatesAutoresizingMaskIntoConstraints = false
        return imageViewSnoopDog
    }()
    
    
    lazy var statusLabel: UITextField = {
        let statusLabel = UITextField()
        statusLabel.text = "Write Your Status"
        statusLabel.textColor = UIColor.gray
        statusLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //   status.frame = CGRect(x: avatar.frame.maxX + 15.0, y: showStatus.frame.minY - 68.0, width: 150, height: 20)
        return statusLabel
    }()
    
    lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton(type: .system)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = true
        setStatusButton.layer.cornerRadius = 8
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.tintColor = .white
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        // showStatus.frame = CGRect(x: 16, y: avatar.frame.maxY + 16.0 , width: screenWidth - 32 , height: 50)
        
        return setStatusButton
    }()
    
    let screenWidth = UIScreen.main.bounds.width
    
    
     override init(frame: CGRect) {
     profileHeader = UIView()
     super.init(frame: frame)
     addSubview(profileHeader)
     addSubview(setStatusButton)
     addSubview(fullNameLabel)
     addSubview(statusLabel)
     // addSubview(avatarImageView)
     }
     
     required init?(coder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
     }
     
    
    /*
     override func layoutSubviews() {
     super.layoutSubviews()
     avatarImageView.addSubview(imageViewSnoopDog)
     setStatusButton.addTarget(self, action: #selector(printStatus), for: .touchUpInside)
     }
     */
    
    func layout() {
        profileHeader.addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: profileHeader.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: profileHeader.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.trailingAnchor.constraint(equalTo: profileHeader.trailingAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            
            profileHeader.topAnchor.constraint(equalTo: profileHeader.safeAreaLayoutGuide.topAnchor, constant: 27),
            profileHeader.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27),
            profileHeader.trailingAnchor.constraint(equalTo: profileHeader.trailingAnchor),
            profileHeader.heightAnchor.constraint(equalToConstant: 150),
            profileHeader.widthAnchor.constraint(equalToConstant: 150),
            
            avatarImageView.topAnchor.constraint(equalTo: profileHeader.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: profileHeader.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.trailingAnchor.constraint(equalTo: profileHeader.trailingAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            
            avatarImageView.topAnchor.constraint(equalTo: profileHeader.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: profileHeader.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.trailingAnchor.constraint(equalTo: profileHeader.trailingAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150)
            
            
        ])
    }
    
    @objc func printStatus() {
        let printText = "\(statusLabel.text ?? "Nil")"
        print(printText)
    }
}
