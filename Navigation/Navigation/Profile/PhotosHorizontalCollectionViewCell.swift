//
//  PhotosSlideCollectionViewCell.swift
//  Navigation
//
//  Created by dmitriy on 26/6/2023.
//

import UIKit

class PhotosHorizontalCollectionViewCell: UICollectionViewCell {
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: ImagesHeader) {
        postImageView.image = UIImage(named: model.image)
    }
    
    func addSubviews(){
        contentView.addSubview(postImageView)
        
    }
    
    func setupContraints() {
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 12)
        ])
    }
}
