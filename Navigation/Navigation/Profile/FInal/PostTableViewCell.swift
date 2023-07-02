//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by dmitriy on 2/7/2023.
//

import UIKit

protocol PostTableViewCellProtocol: AnyObject {
    
    func tapPostImageViewGestureRecognizerDelegate(cell: PostTableViewCell)
    func tapLikeTitleGestureRecognizerDelegate(cell: PostTableViewCell)
}

class PostTableViewCell: UITableViewCell {
    
    weak var delegate: PostTableViewCellProtocol?
    
    var tapLikeTitleGestureRecognizer = UITapGestureRecognizer()
    var tapPostImageViewGestureRecognizer = UITapGestureRecognizer()
    
    struct ViewModel: ViewModelProtocol {
        var author: String
        var description: String
        var image: String
        var likes: Int
        var views: Int
    }
    
    lazy var contentViewCell: UIView = {
        let contentBlackView = UIView()
        contentBlackView.translatesAutoresizingMaskIntoConstraints = false
        return contentBlackView
    }()
    
    lazy var postCell: UIView = {
        let postCell = UIView()
        postCell.translatesAutoresizingMaskIntoConstraints = false
        postCell.backgroundColor = .white
        return postCell
    }()
    
    lazy var author: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.preferredMaxLayoutWidth = frame.size.width
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var descriptionPost: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.preferredMaxLayoutWidth = frame.size.width
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var likeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var likes: UILabel = {
        let label = UILabel()
        label.text  = "Likes: "
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16)
        label.preferredMaxLayoutWidth = frame.size.width
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var views: UILabel = {
        let label = UILabel()
        label.text  = "Views: "
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16)
        label.preferredMaxLayoutWidth = frame.size.width
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupGesture()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        author.text = nil
        postImageView.image = nil
        descriptionPost.text = nil
        likes.text = nil
        views.text = nil
    }
    
    func setupView() {
        contentView.addSubview(author)
        contentView.addSubview(postImageView)
        contentView.addSubview(descriptionPost)
        contentView.addSubview(likeStackView)
        likeStackView.addArrangedSubview(likes)
        likeStackView.addArrangedSubview(views)
        setupConstraints()
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            author.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            author.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            author.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postImageView.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.0),
            descriptionPost.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            likeStackView.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: 16),
            likeStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likeStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            likeStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            
        ])
    }
}

extension PostTableViewCell: Setupable {
    
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }
        author.text = viewModel.author
        postImageView.image = UIImage(named: viewModel.image)
        descriptionPost.text = viewModel.description
        likes.text = "Likes: " + String(viewModel.likes)
        views.text = "Views: " +  String(viewModel.views)
    }
}

extension PostTableViewCell {
    
    func setupGesture() {
        tapLikeTitleGestureRecognizer.addTarget(self, action: #selector(likeTitleHandleGesture(_:)))
        likes.addGestureRecognizer(tapLikeTitleGestureRecognizer)
        likes.isUserInteractionEnabled = true
        
        tapPostImageViewGestureRecognizer.addTarget(self, action: #selector(postImageViewHandleGesture(_:)))
        postImageView.addGestureRecognizer(tapPostImageViewGestureRecognizer)
        postImageView.isUserInteractionEnabled = true
    }
    
    
    @objc func likeTitleHandleGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard tapLikeTitleGestureRecognizer === gestureRecognizer else { return }
        delegate?.tapLikeTitleGestureRecognizerDelegate(cell: self)
    }
    
    @objc func postImageViewHandleGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard tapPostImageViewGestureRecognizer === gestureRecognizer else { return }
        delegate?.tapPostImageViewGestureRecognizerDelegate(cell: self)
    }
}

