//
//  ProfileViewController.swift
//  Navigation
//
//  Created by dmitriy on 1/6/2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        return profileHeaderView
    }()
    
    var newButton: UIButton = {
        let newButton = UIButton(type: .system)
        newButton.setTitle("New Button", for: .normal)
        newButton.setTitleColor(.black, for: .normal)
        newButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        return newButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Profile"
        setupView()
        setupContraintsProfile()
    }
    
    func setupView() {
        
        view.addSubview(newButton)
        view.addSubview(profileHeaderView)
    }
    
    func setupContraintsProfile() {
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}
