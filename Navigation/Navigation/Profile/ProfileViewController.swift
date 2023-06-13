//
//  ProfileViewController.swift
//  Navigation
//
//  Created by dmitriy on 1/6/2023.
//

import UIKit

class ProfileViewController: UIViewController {

    //let profileHeaderView = ProfileHeaderView()
    let insets = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
    
    
    var profileHeaderView: ProfileHeaderView = {
       let profileHeaderView = ProfileHeaderView()
       profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
       profileHeaderView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
       return profileHeaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Profile"
        view.addSubview(profileHeaderView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.bounds.inset(by: insets)
        //
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
    }
}



