//
//  ProfileViewController.swift
//  Navigation
//
//  Created by dmitriy on 1/6/2023.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()
    let insets = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Profile"
        view.addSubview(profileHeaderView)
        // profileHeaderView.layout()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.bounds.inset(by: insets)
        profileHeaderView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
    }
    
    
    
}

