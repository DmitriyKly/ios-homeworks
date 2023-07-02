//
//  AvatarViewController.swift
//  Navigation
//
//  Created by dmitriy on 2/7/2023.
//

import UIKit

class AnimatedAvatarViewController: UIViewController {
    
    lazy var snoopDogImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Snoop dog"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 70
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var widthAvatarImage: NSLayoutConstraint?
    var heightAvatarImage: NSLayoutConstraint?
    var positionXAvatarImage: NSLayoutConstraint?
    var positionYAvatarImage: NSLayoutConstraint?
    
    lazy var transitionButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "x.square")
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.0)
        setupSubView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        toFront()
    }
    
    func setupSubView() {
        view.addSubview(snoopDogImage)
        view.addSubview(transitionButton)
        
        widthAvatarImage = snoopDogImage.widthAnchor.constraint(equalToConstant: 138)
        heightAvatarImage = snoopDogImage.heightAnchor.constraint(equalToConstant: 138)
        positionXAvatarImage = snoopDogImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        positionYAvatarImage = snoopDogImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        
        NSLayoutConstraint.activate([
            transitionButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            transitionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            transitionButton.heightAnchor.constraint(equalToConstant: 40),
            transitionButton.widthAnchor.constraint(equalToConstant: 40),
            
            widthAvatarImage, heightAvatarImage,
            positionXAvatarImage, positionYAvatarImage
        ].compactMap( {$0} ))
    }
    
    func toFront() {
        NSLayoutConstraint.deactivate([
            positionXAvatarImage, positionYAvatarImage,
            widthAvatarImage, heightAvatarImage
        ].compactMap( {$0} ))
        
        widthAvatarImage = snoopDogImage.widthAnchor.constraint(equalTo: view.widthAnchor)
        heightAvatarImage = snoopDogImage.heightAnchor.constraint(equalTo: view.widthAnchor)
        positionXAvatarImage = snoopDogImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        positionYAvatarImage = snoopDogImage.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        NSLayoutConstraint.activate([
            positionXAvatarImage, positionYAvatarImage,
            widthAvatarImage, heightAvatarImage
        ].compactMap( {$0} ))
        view.backgroundColor = .black.withAlphaComponent(0.8)
        
        UIView.animate(withDuration: 1, animations: {
            self.snoopDogImage.layer.cornerRadius = self.view.frame.width / 2
            self.view.layoutIfNeeded()
        }) { _ in
            self.transitionButton.alpha = 1
            self.snoopDogImage.layer.cornerRadius = 0
            
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func toBack() {
        snoopDogImage.layer.cornerRadius = view.frame.width / 2
        NSLayoutConstraint.deactivate([
            positionXAvatarImage, positionYAvatarImage,
            widthAvatarImage, heightAvatarImage
        ].compactMap( {$0} ))
        
        widthAvatarImage = snoopDogImage.widthAnchor.constraint(equalToConstant: 138)
        heightAvatarImage = snoopDogImage.heightAnchor.constraint(equalToConstant: 138)
        positionXAvatarImage = snoopDogImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        positionYAvatarImage = snoopDogImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        
        NSLayoutConstraint.activate([
            positionXAvatarImage, positionYAvatarImage,
            widthAvatarImage, heightAvatarImage
        ].compactMap( {$0} ))
        
        view.backgroundColor = .black.withAlphaComponent(0.8)
        transitionButton.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
            self.snoopDogImage.layer.cornerRadius = 70
            self.view.layoutIfNeeded()
        }) { _ in
            self.view.removeFromSuperview()
        }
    }
    
    @objc  func clickButton() {
        toBack()
    }
}
