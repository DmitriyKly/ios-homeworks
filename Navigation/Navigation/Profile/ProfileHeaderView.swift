//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by dmitriy on 8/6/2023.
//

import UIKit

class ProfileHeaderView: UIView {
    let profileHeader: UIView
    let avatar = UIView()
    let name = UILabel()
    let imageViewSnoopDog = UIImageView()
    let status: UITextField
    let showStatus: UIButton
    let screenWidth = UIScreen.main.bounds.width
    
    
    override init(frame: CGRect) {
        profileHeader = UIView()
        status = UITextField()
        showStatus = UIButton(type: .system)
        super.init(frame: frame)
        addSubview(profileHeader)
        addSubview(status)
        addSubview(showStatus)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatar.frame = CGRect(x: 16.0, y: 16.0, width: 150, height: 150)
        avatar.layer.cornerRadius = avatar.frame.height/2
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.borderWidth = 3
        
        profileHeader.addSubview(avatar)
        
        imageViewSnoopDog.image = UIImage(named: "Snoop dog")
        imageViewSnoopDog.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        imageViewSnoopDog.contentMode = .scaleAspectFit
        imageViewSnoopDog.clipsToBounds = true
        imageViewSnoopDog.layer.cornerRadius = avatar.layer.cornerRadius
        
        avatar.addSubview(imageViewSnoopDog)
        
        name.text = "Snoop Dog"
        name.font = UIFont.boldSystemFont(ofSize: 18.0)
        name.textColor = UIColor.black
        name.frame = CGRect(x: avatar.frame.maxX + 15.0 , y: 27.0, width: 100 , height: 20)
        
        profileHeader.addSubview(name)
        
        status.frame = CGRect(x: avatar.frame.maxX + 15.0, y: showStatus.frame.minY - 68.0, width: 150, height: 20)
        status.text = "Write Your Status"
        status.textColor = UIColor.gray
        status.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        
        showStatus.translatesAutoresizingMaskIntoConstraints = true
        showStatus.frame = CGRect(x: 16, y: avatar.frame.maxY + 16.0 , width: screenWidth - 32 , height: 50)
        showStatus.layer.cornerRadius = 16
        showStatus.setTitle("Show status", for: .normal)
        showStatus.tintColor = .white
        showStatus.backgroundColor = .systemBlue
        
        showStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatus.layer.shadowRadius = 4
        showStatus.layer.shadowColor = UIColor.black.cgColor
        showStatus.layer.shadowOpacity = 0.7
        
        showStatus.addTarget(self, action: #selector(printStatus), for: .touchUpInside)
    }
    
    @objc func printStatus() {
        let printText = "\(status.text ?? "Nil")"
     print(printText)
     }
}
