//
//  FeedViewController.swift
//  Navigation
//
//  Created by dmitriy on 1/6/2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "First post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Feed"
   
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let button = UIButton(type: .system)
        button.frame = CGRect(origin: CGPoint(x:0, y:0), size: CGSize(width: 200, height: 50))
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .black
        button.center = view.center
        button.tintColor = .white
        view.addSubview(button)
        button.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
    }
    
    @objc func showDetails() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titlePost = post.title
    }
}
