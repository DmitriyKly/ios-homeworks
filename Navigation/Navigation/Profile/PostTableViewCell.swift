//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by dmitriy on 23/6/2023.
//

import UIKit

    class PostTableViewCell: UITableViewCell {
        
         lazy var contentWhiteView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .black
            return view
        }()
        
        lazy var postImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        lazy var author: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFont(ofSize: 26)
            return label
        }()
        
        lazy var descriptionPost: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor.systemGray
            label.numberOfLines = 0
            return label
        }()
        
        lazy var likes: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 20)
            return label
        }()
        
        lazy var views: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 20)
            label.numberOfLines = 0
            return label
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            addSubviews()
            setupContraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
        override func prepareForReuse() {
            super.prepareForReuse()
            postImageView.image = nil
            author.text = nil
            descriptionPost.text = nil
            likes.text = nil
            views.text = nil
        }
        
        func setupCell(Cell: PostView) {
            postImageView.image = UIImage(named:Cell.image)
            author.text = Cell.author
            descriptionPost.text = Cell.description
            likes.text = "Likes: " + String(Cell.likes)
            views.text = "Views: " + String(Cell.views)
        }
        
        func addSubviews() {
            contentView.addSubview(contentWhiteView)
            contentView.addSubview(postImageView)
            contentView.addSubview(author)
            contentView.addSubview(descriptionPost)
            contentView.addSubview(likes)
            contentView.addSubview(views)
            
        }

        private func setupContraints() {
        
            NSLayoutConstraint.activate([
                contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
                contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                
                author.topAnchor.constraint(equalTo: contentWhiteView.topAnchor, constant: 15),
                author.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 20),
                author.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: 200),
                author.heightAnchor.constraint(equalToConstant: 30),
                
                postImageView.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 15),
                postImageView.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor),
                postImageView.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor),
                postImageView.heightAnchor.constraint(equalToConstant: 200),
                
                descriptionPost.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
                descriptionPost.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 20),
                descriptionPost.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor),
                descriptionPost.heightAnchor.constraint(equalToConstant: 50),
                
                likes.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor),
                likes.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 20),
                likes.heightAnchor.constraint(equalToConstant: 50),
                likes.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor),
                
                views.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor),
                views.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -20),
                views.heightAnchor.constraint(equalToConstant: 50),
                views.bottomAnchor.constraint(equalTo: likes.bottomAnchor)
            ])
        }
    }
    
