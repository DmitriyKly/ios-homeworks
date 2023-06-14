//
//  ProfileViewController.swift
//  Navigation
//
//  Created by dmitriy on 1/6/2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Profile"
        view.addSubview(profileHeaderView)
        profileHeaderView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        let newButton = UIButton(type: .system)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.setTitle("New Button", for: .normal)
        newButton.setTitleColor(.black, for: .normal)
        newButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        view.addSubview(newButton)
        NSLayoutConstraint.activate([
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
