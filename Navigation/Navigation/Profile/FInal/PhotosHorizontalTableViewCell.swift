//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by dmitriy on 2/7/2023.
//


import UIKit

protocol PhotosTableViewCellProtocol: AnyObject {
    func delegateButtonAction(cell: PhotosTableViewCell)
}

class PhotosTableViewCell: UITableViewCell {
    
    enum Constant {
        static let itemCount: CGFloat = 4
    }
    
    weak var delegate: PhotosTableViewCellProtocol?
    
    lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text  = "Photos"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        return label
    }()
    
    lazy var transitionButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "arrow.forward")
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        return button
    }()
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    
    lazy var photoCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollection")
        stackView.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .systemGray6
        contentView.addSubview(backView)
        backView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(transitionButton)
        backView.addSubview(photoCollectionView)
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
            //transitionButton.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 1),
            photoCollectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            photoCollectionView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            photoCollectionView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
            photoCollectionView.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            photoCollectionView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),
            
            transitionButton.widthAnchor.constraint(equalToConstant: 30),
            transitionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            transitionButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
    
    @objc  func buttonAction() {
        delegate?.delegateButtonAction(cell: self)
    }
    
    func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let needWidth = width - 4 * spacing
        let itemWidth = floor(needWidth / Constant.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

extension PhotosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
}

extension PhotosTableViewCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
}

