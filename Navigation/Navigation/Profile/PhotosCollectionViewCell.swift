//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by dmitriy on 26/6/2023.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    lazy var postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.contentMode = .scaleAspectFill
        
        return postImageView
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
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
