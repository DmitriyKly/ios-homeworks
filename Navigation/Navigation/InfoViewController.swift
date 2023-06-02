//
//  InfoViewController.swift
//  Navigation
//
//  Created by dmitriy on 2/6/2023.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Info"

        let alertButton = UIButton(type: .system)
        alertButton.frame = CGRect(origin: CGPoint(x:0, y:0), size: CGSize(width: 200, height: 50))
        alertButton.setTitle("Alert", for: .normal)
        alertButton.backgroundColor = .red
        alertButton.center = view.center
        alertButton.tintColor = .white
        view.addSubview(alertButton)
        alertButton.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
    }
    
    @objc func alertAction() {
        
        let alert = UIAlertController(title: "Post", message: "Do u want Alert?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Yeah", style: .default, handler:  { (action) -> Void in print("Alert come with u")
        })
        let cancel = UIAlertAction(title: "Nope", style: .cancel) { (action) -> Void in print("Sorry man") }
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
}
