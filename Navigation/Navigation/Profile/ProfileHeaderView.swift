//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by dmitriy on 8/6/2023.
//

import UIKit

class ProfileHeaderView: UIView {
    let profileHeader: UIView
    
    lazy var avatar: UIView = {
    let avatar = UIView()
    avatar.frame = CGRect(x: 16.0, y: 16.0, width: 150, height: 150)
    avatar.layer.cornerRadius = avatar.frame.height/2
    avatar.layer.borderColor = UIColor.white.cgColor
    avatar.layer.borderWidth = 3
        return avatar
    }()
        
    lazy var name: UILabel = {
        let name = UILabel()
        name.text = "Snoop Dog"
        name.font = UIFont.boldSystemFont(ofSize: 18.0)
        name.textColor = UIColor.black
        name.frame = CGRect(x: avatar.frame.maxX + 15.0 , y: 27.0, width: 100 , height: 20)
        return name
    }()
    
    lazy var imageViewSnoopDog: UIImageView = {
        imageViewSnoopDog = UIImageView()
        imageViewSnoopDog.image = UIImage(named: "Snoop dog")
        imageViewSnoopDog.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        imageViewSnoopDog.contentMode = .scaleAspectFit
        imageViewSnoopDog.clipsToBounds = true
        imageViewSnoopDog.layer.cornerRadius = avatar.layer.cornerRadius
       
        return imageViewSnoopDog
    }()
    
    
    lazy var status: UITextField = {
    let status = UITextField()
        status.text = "Write Your Status"
        status.textColor = UIColor.gray
        status.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        status.frame = CGRect(x: avatar.frame.maxX + 15.0, y: showStatus.frame.minY - 68.0, width: 150, height: 20)
        return status
    }()
    
    lazy var showStatus: UIButton = {
        let showStatus = UIButton(type: .system)
        showStatus.translatesAutoresizingMaskIntoConstraints = true
        showStatus.layer.cornerRadius = 8
        showStatus.setTitle("Show status", for: .normal)
        showStatus.tintColor = .white
        showStatus.backgroundColor = .systemBlue
        showStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatus.layer.shadowRadius = 4
        showStatus.layer.shadowColor = UIColor.black.cgColor
        showStatus.layer.shadowOpacity = 0.7
        showStatus.frame = CGRect(x: 16, y: avatar.frame.maxY + 16.0 , width: screenWidth - 32 , height: 50)
        
        return showStatus
    }()
    
    let screenWidth = UIScreen.main.bounds.width
    
    
    override init(frame: CGRect) {
        profileHeader = UIView()
        super.init(frame: frame)
        addSubview(profileHeader)
        addSubview(status)
        addSubview(showStatus)
        addSubview(name)
        addSubview(avatar)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatar.addSubview(imageViewSnoopDog)
        showStatus.addTarget(self, action: #selector(printStatus), for: .touchUpInside)
    }
    
    
    @objc func printStatus() {
        let printText = "\(status.text ?? "Nil")"
     print(printText)
     }
}
