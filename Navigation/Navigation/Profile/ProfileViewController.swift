//
//  ProfileViewController.swift
//  Navigation
//
//  Created by dmitriy on 1/6/2023.
//

import UIKit


class ProfileViewController: UIViewController {
    
        private let postFeed = PostView.makePost()
        
        private lazy var tableView: UITableView = {
            let tableView = UITableView(frame: .zero, style: .grouped)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.rowHeight = UITableView.automaticDimension
            tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
            tableView.dataSource = self
            tableView.delegate = self
            return tableView
        }()

        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            addSubviews()
            setupContraints()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.navigationBar.isHidden = true
        
        }
        private func addSubviews(){
            view.addSubview(tableView)
        }
        
        
        private func setupContraints() {
            
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }
    }



    extension ProfileViewController: UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            2
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section == 0   {
                return 0
            }
            else {
               
                return postFeed.count
            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                 let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
                     cell.setupCell(Cell: postFeed[indexPath.row])
                 return cell
             }
     
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            if section == 0 {
                return ProfileHeaderView()
            } else {
                return nil
            }
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.section == 0 {
                return 300
            }
            return tableView.rowHeight
        }
 
 }
 

    extension ProfileViewController: UITableViewDelegate {}
    
extension UIView {
    static var identifier: String {
        String(describing: self)
    }
}
 
    
    
