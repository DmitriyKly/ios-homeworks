//
//  AnimatedPhotoViewController.swift
//  Navigation
//
//  Created by dmitriy on 2/7/2023.
//


import UIKit

class AnimatedPhotoViewController: UIViewController {
    
    struct ViewModel: ViewModelProtocol {
        var image: String
    }
    
    lazy var largeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        return imageView
    }()
    
    var widthLargeImage: NSLayoutConstraint?
    var heightLargeImage: NSLayoutConstraint?
    var positionXLargeImage: NSLayoutConstraint?
    var positionYLargeImage: NSLayoutConstraint?
    
    lazy var transitionButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "x.square")
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0.0
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.0)
        setupSubView()
        view.layoutIfNeeded()
        toFront()
    }
    
    func setupSubView() {
        view.addSubview(largeImage)
        view.addSubview(transitionButton)
        
        widthLargeImage = largeImage.widthAnchor.constraint(equalToConstant: 138)
        heightLargeImage = largeImage.heightAnchor.constraint(equalToConstant: 138)
        positionXLargeImage = largeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        positionYLargeImage = largeImage.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        NSLayoutConstraint.activate([
            transitionButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            transitionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            transitionButton.heightAnchor.constraint(equalToConstant: 40),
            transitionButton.widthAnchor.constraint(equalToConstant: 40),
            
            widthLargeImage, heightLargeImage, positionXLargeImage, positionYLargeImage
        ].compactMap( {$0} ))
    }
    
    func toFront() {
        NSLayoutConstraint.deactivate([
            positionXLargeImage, positionYLargeImage, widthLargeImage, heightLargeImage
        ].compactMap( {$0} ))
        
        widthLargeImage = largeImage.widthAnchor.constraint(equalTo: view.widthAnchor)
        heightLargeImage = largeImage.heightAnchor.constraint(equalTo: view.widthAnchor)
        positionXLargeImage = largeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        positionYLargeImage = largeImage.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        NSLayoutConstraint.activate([
            positionXLargeImage, positionYLargeImage, widthLargeImage, heightLargeImage
        ].compactMap( {$0} ))
        largeImage.layer.cornerRadius = 0.0
        view.backgroundColor = .black.withAlphaComponent(0.8)
        
        UIView.animate(withDuration: 1, animations: {
            self.view.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: 0.25) {
                self.transitionButton.alpha = 1
            }
        }
    }
    
    func toBack() {
        NSLayoutConstraint.deactivate([
            positionXLargeImage, positionYLargeImage, widthLargeImage, heightLargeImage
        ].compactMap( {$0} ))
        
        widthLargeImage = largeImage.widthAnchor.constraint(equalToConstant: 138)
        heightLargeImage = largeImage.heightAnchor.constraint(equalToConstant: 138)
        positionXLargeImage = largeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        positionYLargeImage = largeImage.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        NSLayoutConstraint.activate([
            positionXLargeImage, positionYLargeImage, widthLargeImage, heightLargeImage
        ].compactMap( {$0} ))
        largeImage.layer.cornerRadius = 70.0
        view.backgroundColor = .black.withAlphaComponent(0.8)
        transitionButton.alpha = 0.0
        
        UIView.animate(withDuration: 1, animations: {
            self.view.layoutIfNeeded()
        }) { _ in
            self.view.removeFromSuperview()
            self.tabBarController?.tabBar.isHidden = false
            self.navigationController?.navigationBar.isHidden = false
        }
    }
    
    @objc  func clickButton() {
        toBack()
    }
}

extension AnimatedPhotoViewController: Setupable {
    
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }
        largeImage.image = UIImage(named: viewModel.image)
    }
}


