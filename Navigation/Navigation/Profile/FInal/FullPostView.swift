//
//  FullPostView.swift
//  Navigation
//
//  Created by dmitriy on 2/7/2023.
//

import UIKit

class FullPostView: UIView {
    
    struct ViewModel: ViewModelProtocol {
        var author: String
        var description: String
        var image: String
        var likes: Int
        var views: Int
    }
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .black.withAlphaComponent(0.8)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var authorLabel: UILabel = {
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
        imageView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        return imageView
    }()
    
    lazy var descriptionLabel: UILabel = {
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
        stackView.distribution = .fill
        stackView.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var likeTitle: UILabel = {        let label = UILabel()
        label.text = "Likes: "
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16)
        label.preferredMaxLayoutWidth = frame.size.width
        label.textColor = .black
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(500), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var viewTitle: UILabel = {
        let label = UILabel()
        label.text  = "Views: "
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16)
        label.preferredMaxLayoutWidth = frame.size.width
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(500), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var transitionButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "x.square")
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(mainView)
        addSubview(transitionButton)
        mainView.addSubview(backView)
        backView.addSubview(authorLabel)
        backView.addSubview(postImageView)
        backView.addSubview(descriptionLabel)
        backView.addSubview(likeStackView)
        likeStackView.addArrangedSubview(likeTitle)
        likeStackView.addArrangedSubview(viewTitle)
        setupConstraints()
    }
    
    func setupConstraints() {
        let topConstraint = mainView.topAnchor.constraint(equalTo: topAnchor)
        let leadingConstraint = mainView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailingConstraint = mainView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bottomConstraint = mainView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        let topConstraintBackView = backView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor)
        let leadingConstraintBackView = backView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor)
        let trailingConstraintBackView = backView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
        let bottomConstraintBackView = backView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        
        let topConstraintAuthorLabel = authorLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16)
        let leadingConstraintAuthorLabel = authorLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16)
        let trailingConstraintAuthorLabel = authorLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16)
        
        let topConstraintPostImageView = postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12)
        let leadingConstraintPostImageView = postImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor)
        let trailingConstraintPostImageView = postImageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor)
        let widthPostImageView = postImageView.heightAnchor.constraint(equalTo: backView.widthAnchor, multiplier: 1.0)
        
        let topConstraintDescriptionLabel = descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16)
        let leadingConstraintDescriptionLabell = descriptionLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16)
        let trailingConstraintDescriptionLabel = descriptionLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16)
        
        let topConstraintLikeStackView = likeStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16)
        let leadingConstraintLikeStackView = likeStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16)
        let trailingConstraintLikeStackView = likeStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16)
        let bottomConstraintLikeStackView = likeStackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16)
        
        let buttonTopConstrain = transitionButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        let buttonTrailingConstraint = transitionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        let buttonHeightConstraint = transitionButton.heightAnchor.constraint(equalToConstant: 40)
        let buttonWidthConstraint = transitionButton.widthAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, bottomConstraint, trailingConstraint,
            topConstraintAuthorLabel, topConstraintPostImageView,widthPostImageView,
            leadingConstraintAuthorLabel, trailingConstraintAuthorLabel,
            topConstraintDescriptionLabel, leadingConstraintDescriptionLabell,
            trailingConstraintDescriptionLabel, topConstraintLikeStackView,
            leadingConstraintLikeStackView, trailingConstraintLikeStackView,
            bottomConstraintLikeStackView, leadingConstraintPostImageView,
            trailingConstraintPostImageView,
            topConstraintBackView, bottomConstraintBackView,
            leadingConstraintBackView, trailingConstraintBackView,
            buttonTopConstrain, buttonTrailingConstraint,
            buttonHeightConstraint, buttonWidthConstraint
        ])
    }
    
    @objc  func clickButton() {
        removeFromSuperview()
    }
}

extension FullPostView: Setupable {
    
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }
        
        authorLabel.text = viewModel.author
        postImageView.image = UIImage(named: viewModel.image)
        descriptionLabel.text = viewModel.description
        likeTitle.text = "Likes: " + String(viewModel.likes)
        viewTitle.text = "Views: " + String(viewModel.views)
    }
}

