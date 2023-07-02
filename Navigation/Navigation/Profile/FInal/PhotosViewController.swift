//
//  PhotosViewController.swift
//  Navigation
//
//  Created by dmitriy on 2/7/2023.
//

import UIKit

class PhotosViewController: UIViewController {

     enum Constant {
        static let itemCount: CGFloat = 3
    }
    
     lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        return layout
    }()
    
     lazy var photoCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollection")
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Photo Gallery"
    }
    
     func setupCollectionView() {
        view.addSubview(photoCollectionView)
        let topConstraint = photoCollectionView.topAnchor.constraint(equalTo: view.topAnchor)
        let leadingConstraint = photoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = photoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let bottomConstraint = photoCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ])
    }
    
     func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let needWidth = width - 5 * spacing
        let itemWidth = floor(needWidth / Constant.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
}


extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollection", for: indexPath) as! PhotosCollectionViewCell
        
            let photos = photosImage[indexPath.row]
            let viewModel = PhotosCollectionViewCell.ViewModel(image: photos.image)
            cell.setup(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumLineSpacing
        return itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let animatedPhotoViewController = AnimatedPhotoViewController()
        
        let photos = photosImage[indexPath.row]
        let viewModel = AnimatedPhotoViewController.ViewModel(image: photos.image)
        animatedPhotoViewController.setup(with: viewModel)
        
        view.addSubview(animatedPhotoViewController.view)
        addChild(animatedPhotoViewController)
        animatedPhotoViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animatedPhotoViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animatedPhotoViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animatedPhotoViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            animatedPhotoViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        navigationController?.navigationBar.isHidden = true
        animatedPhotoViewController.didMove(toParent: self)
    }
}
