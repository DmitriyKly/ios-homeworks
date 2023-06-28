//
//  PhotosController.swift
//  Navigation
//
//  Created by dmitriy on 26/6/2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    var tapHandler: (() -> Void)? = nil
        
    private let postImages = ImagesHeader.maketPost()
    
    private let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headerLabel.text = "Photos"
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return headerLabel
    }()
    
    private lazy var imageArrow: UIImageView = {
        let imageArrow = UIImageView()
        imageArrow.image =  UIImage(systemName: "arrow.right")
        imageArrow.contentMode = .scaleAspectFill
        imageArrow.tintColor = .black
        imageArrow.clipsToBounds = true
        imageArrow.translatesAutoresizingMaskIntoConstraints = false
        
        return imageArrow
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray2
        collectionView.dataSource = self
        collectionView.register(PhotosHorizontalCollectionViewCell.self, forCellWithReuseIdentifier: PhotosHorizontalCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        
        return collectionView
    }()
    
    @objc func tapAction() {
        if let action = self.tapHandler { action() }
    }
    
    private let postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.contentMode = .scaleAspectFit
        return postImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: ImagesHeader) {
        postImageView.image = UIImage(named: model.image)
    }
    
    private func addSubviews(){
        contentView.addSubview(collectionView)
        contentView.addSubview(imageArrow)
        contentView.addSubview(headerLabel)
    }
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imageArrow.widthAnchor.constraint(equalToConstant: Metric.imageArrowInset),
            imageArrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            imageArrow.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: topAnchor ,constant: Metric.labelInset),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: Metric.labelInset)
        ])
    }
}


extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        postImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosHorizontalCollectionViewCell.identifier, for: indexPath) as! PhotosHorizontalCollectionViewCell
        cell.setupCell(model: postImages[indexPath.row])
        return cell
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    private var inset: CGFloat { return 8}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 10 * 4) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}

extension PhotosTableViewCell {
    enum Metric {
        static let labelInset: CGFloat = 12
        static let imageInset: CGFloat = 12
        static let imageLeftInset: CGFloat = 8
        static let imageArrowInset: CGFloat = 30
    }
}

extension PhotosTableViewCell {
    
}
