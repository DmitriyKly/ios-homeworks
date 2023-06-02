//
//  PostViewController.swift
//  Navigation
//
//  Created by dmitriy on 1/6/2023.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "My Post"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationItem.title = titlePost
        
        
        let infoBar = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(infoView))
        navigationItem.rightBarButtonItem = infoBar
        
    }
    
    @objc func infoView() {
        
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true, completion: nil)
    }
}


