//
//  PhotosTableViewCell01.swift
//  Navigation
//
//  Created by dmitriy on 26/6/2023.
//
/*
import UIKit
class PhotosTableViewCell: UITableViewCell {
    
    var tapHandler: (() -> Void)? = nil
    
    lazy var contentViewCell: UIView = {
        let contentViewCell = UIView()
        contentViewCell.translatesAutoresizingMaskIntoConstraints = false
        return contentViewCell
    }()
    
    lazy var header: UILabel = {
        let header = UILabel()
        header.font = UIFont.boldSystemFont(ofSize: 24)
        header.text = "Photos"
        header.translatesAutoresizingMaskIntoConstraints = false
        
        return header
    }()
    
    lazy var image01: UIImageView = {
        let image01 = UIImageView()
        image01.image = UIImage(named: "space3_01")
        image01.contentMode = .scaleAspectFill
        image01.clipsToBounds = true
        image01.translatesAutoresizingMaskIntoConstraints = false
        image01.layer.cornerRadius = 6
        return image01
    }()
    
    lazy var image02: UIImageView = {
        let image02 = UIImageView()
        image02.image = UIImage(named: "space3_03")
        image02.contentMode = .scaleAspectFill
        image02.clipsToBounds = true
        image02.translatesAutoresizingMaskIntoConstraints = false
        image02.layer.cornerRadius = 6
        return image02
    }()
    
    lazy var image03: UIImageView = {
        let image03 = UIImageView()
        image03.image = UIImage(named: "space3_06")
        image03.contentMode = .scaleAspectFill
        image03.clipsToBounds = true
        image03.translatesAutoresizingMaskIntoConstraints = false
        image03.layer.cornerRadius = 6
        return image03
    }()
    
    lazy var image04: UIImageView = {
        let image04 = UIImageView()
        image04.image = UIImage(named: "space3_07")
        image04.contentMode = .scaleAspectFill
        image04.clipsToBounds = true
        image04.translatesAutoresizingMaskIntoConstraints = false
        image04.layer.cornerRadius = 6
        return image04
    }()
    
    lazy var imageArrow: UIImageView = {
        let imageArrow = UIImageView()
        imageArrow.image =  UIImage(systemName: "arrow.right")
        imageArrow.contentMode = .scaleAspectFill
        imageArrow.tintColor = .black
        imageArrow.clipsToBounds = true
        imageArrow.translatesAutoresizingMaskIntoConstraints = false
        
        return imageArrow
    }()
    /*
    lazy var imagesStories: UIView = {
        let imagesStories = UIView()
        return imagesStories
    }()
    */
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupContraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {
        contentView.addSubview(contentViewCell)
        contentViewCell.addSubview(header)
        contentViewCell.addSubview(image01)
        contentViewCell.addSubview(image02)
        contentViewCell.addSubview(image03)
        contentViewCell.addSubview(image04)
        contentViewCell.addSubview(imageArrow)
        
    }
    
    private func setupContraints() {
        
        let imageSize: CGFloat = contentView.frame.width / 4
        
        NSLayoutConstraint.activate([
            
            contentViewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            header.topAnchor.constraint(equalTo: contentViewCell.topAnchor, constant: 12),
            header.leadingAnchor.constraint(equalTo: contentViewCell.leadingAnchor, constant: 12),
            
            image01.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 12),
            image01.leadingAnchor.constraint(equalTo: contentViewCell.leadingAnchor, constant: 12),
            image01.bottomAnchor.constraint(equalTo: contentViewCell.bottomAnchor, constant: -12),
            image01.widthAnchor.constraint(equalToConstant: imageSize),
            image01.heightAnchor.constraint(equalToConstant: imageSize),
            
            image02.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 12),
            image02.leadingAnchor.constraint(equalTo: image01.trailingAnchor, constant: 8),
            image02.bottomAnchor.constraint(equalTo: contentViewCell.bottomAnchor, constant: -12),
            image02.widthAnchor.constraint(equalToConstant: imageSize),
            image02.heightAnchor.constraint(equalToConstant: imageSize),
            
            image03.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 12),
            image03.leadingAnchor.constraint(equalTo: image02.trailingAnchor, constant: 8),
            image03.bottomAnchor.constraint(equalTo: contentViewCell.bottomAnchor, constant: -12),
            image03.widthAnchor.constraint(equalToConstant: imageSize),
            image03.heightAnchor.constraint(equalToConstant: imageSize),
            
            image04.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 12),
            image04.leadingAnchor.constraint(equalTo: image03.trailingAnchor, constant: 8),
            image04.bottomAnchor.constraint(equalTo: contentViewCell.bottomAnchor, constant: -12),
            image04.widthAnchor.constraint(equalToConstant: imageSize),
            image04.heightAnchor.constraint(equalToConstant: imageSize),
            
            imageArrow.widthAnchor.constraint(equalToConstant: 30),
            imageArrow.trailingAnchor.constraint(equalTo: contentViewCell.trailingAnchor, constant: -12),
            imageArrow.centerYAnchor.constraint(equalTo: header.centerYAnchor)
            
        ])
    }
}

*/
