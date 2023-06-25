//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by dmitriy on 23/6/2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    lazy var contentViewCell: UIView = {
        let contentBlackView = UIView()
        contentBlackView.translatesAutoresizingMaskIntoConstraints = false
        return contentBlackView
    }()
    
    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var postCell: UIView = {
        let postCell = UIView()
        postCell.translatesAutoresizingMaskIntoConstraints = false
        postCell.backgroundColor = .white
        return postCell
    }()
    
    lazy var author: UILabel =  {
        let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font = UIFont.boldSystemFont(ofSize: 20)
        author.backgroundColor = .white
        author.numberOfLines = 2
        author.textAlignment = .left
        return author
    }()
    
    
    lazy var descriptionPost: UILabel = {
        let descriptionPost = UILabel()
        descriptionPost.translatesAutoresizingMaskIntoConstraints = false
        descriptionPost.font = UIFont.systemFont(ofSize: 14)
        descriptionPost.textColor = UIColor.systemGray
        descriptionPost.numberOfLines = 0
        descriptionPost.backgroundColor = .white
        return descriptionPost
    }()
    
    lazy var likes: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.numberOfLines = 0
        likes.font = UIFont.systemFont(ofSize: 16)
        likes.backgroundColor = .white
        return likes
    }()
    
    lazy var views: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = UIFont.systemFont(ofSize: 16)
        views.numberOfLines = 0
        return views
    }()
    
    lazy var systemInfo: UIView = {
        let systemInfo = UIView()
        
        return systemInfo
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
        contentView.addSubview(contentViewCell)
        contentViewCell.addSubview(postCell)
        postCell.addSubview(author)
        postCell.addSubview(postImageView)
        postCell.addSubview(descriptionPost)
        postCell.addSubview(likes)
        postCell.addSubview(views)
        
    }
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            
            contentViewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            postCell.topAnchor.constraint(equalTo: contentViewCell.topAnchor),
            postCell.leadingAnchor.constraint(equalTo: contentViewCell.leadingAnchor),
            postCell.trailingAnchor.constraint(equalTo: contentViewCell.trailingAnchor),
            
            author.topAnchor.constraint(equalTo: postCell.topAnchor),
            author.leadingAnchor.constraint(equalTo: postCell.leadingAnchor, constant: 16),
            author.trailingAnchor.constraint(equalTo: postCell.trailingAnchor),
            author.heightAnchor.constraint(equalToConstant: 60),
            author.bottomAnchor.constraint(equalTo: postCell.bottomAnchor),
            
            postImageView.topAnchor.constraint(equalTo: author.bottomAnchor),
            postImageView.leadingAnchor.constraint(equalTo: postCell.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: postCell.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionPost.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 5),
            descriptionPost.leadingAnchor.constraint(equalTo: postCell.leadingAnchor, constant: 16),
            descriptionPost.trailingAnchor.constraint(equalTo: postCell.trailingAnchor),
            
            likes.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: 15),
            likes.leadingAnchor.constraint(equalTo: postCell.leadingAnchor, constant: 16),
            likes.bottomAnchor.constraint(equalTo: contentViewCell.bottomAnchor,constant: -15),
            
            views.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: 15),
            views.trailingAnchor.constraint(equalTo: contentViewCell.trailingAnchor, constant: -16),
            views.bottomAnchor.constraint(equalTo: likes.bottomAnchor)
        ])
    }
}
