//
//  ProfileViewController.swift
//  Navigation
//
//  Created by dmitriy on 1/6/2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        
        return tableView
    }()
    
    /*
    var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        return profileHeaderView
    }()
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Profile"
        // setupView() 
       setupContraintsProfile()
    }
    
    func setupView() {
        // view.addSubview(profileHeaderView)
        view.addSubview(tableView)
    }
    
   
    func setupContraintsProfile() {
        NSLayoutConstraint.activate([
           /*
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
    */
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
}

extension ProfileViewController: UITableViewDelegate {}
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
