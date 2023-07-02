//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by dmitriy on 2/7/2023.
//

import UIKit

protocol ProfileTableHeaderViewProtocol: AnyObject {
    func buttonAction()
    func delegateActionAnimatedAvatar(cell: ProfileTableHeaderView)
}

class ProfileTableHeaderView: UITableViewHeaderFooterView {
    
    var statusText: String?
    
    lazy var imageViewSnoopDog: UIImageView = {
        let imageViewSnoopDog = UIImageView()
        imageViewSnoopDog.image = UIImage(named: "Snoop dog")
        imageViewSnoopDog.contentMode = .scaleAspectFill
        imageViewSnoopDog.clipsToBounds = true
        imageViewSnoopDog.translatesAutoresizingMaskIntoConstraints = false
        imageViewSnoopDog.layer.cornerRadius = 70
        imageViewSnoopDog.layer.borderColor = UIColor.white.cgColor
        imageViewSnoopDog.layer.borderWidth = 3
        
        return imageViewSnoopDog
    }()
    
    lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Snoop Dog"
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        fullNameLabel.textColor = UIColor.black
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return fullNameLabel
    }()
    
    
    lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Write Your Status"
        statusLabel.textColor = UIColor.gray
        statusLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return statusLabel
    }()
    
    
    lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton(type: .system)
        setStatusButton.layer.cornerRadius = 8
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.tintColor = .white
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()
    
    
    lazy var labelArrangedView: UIStackView = {
        let labelStackView = UIStackView()
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.axis = .vertical
        labelStackView.distribution = .fillEqually
        labelStackView.spacing = 40
        return labelStackView
    }()
    
    lazy var avatarArrangedView: UIStackView = {
        let avatarStackView = UIStackView()
        avatarStackView.translatesAutoresizingMaskIntoConstraints = false
        avatarStackView.axis = .horizontal
        avatarStackView.spacing = 16
        return avatarStackView
    }()
    
    
    lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.backgroundColor = UIColor.white
        statusTextField.layer.cornerRadius = 12
        statusTextField.textColor = UIColor.black
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.addTarget(nil, action: Selector(("firstResponderAction:")), for: .editingDidEndOnExit)
        statusTextField.placeholder = "Set your status.."
        return statusTextField
    }()
    
    weak var delegate: ProfileTableHeaderViewProtocol?
    
    var tapGestureRecognizer = UITapGestureRecognizer()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        createSubviews()
        addButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubviews() {
        addSubview(avatarArrangedView)
        avatarArrangedView.addArrangedSubview(imageViewSnoopDog)
        avatarArrangedView.addArrangedSubview(labelArrangedView)
        labelArrangedView.addArrangedSubview(fullNameLabel)
        labelArrangedView.addArrangedSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        setupConstraints()
        setupTapGesture()
    }
    
    func addButtons() {
        setStatusButton.addTarget(self, action: #selector(printStatus), for: .touchUpInside)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarArrangedView.topAnchor.constraint(equalTo: topAnchor),
            avatarArrangedView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarArrangedView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            imageViewSnoopDog.widthAnchor.constraint(equalToConstant: 138),
            imageViewSnoopDog.heightAnchor.constraint(equalToConstant: 138),
            
            fullNameLabel.widthAnchor.constraint(equalToConstant: 100),
            fullNameLabel.topAnchor.constraint(equalTo: avatarArrangedView.topAnchor ,constant: 0),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarArrangedView.trailingAnchor,constant: 20),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor,constant: 30),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.leadingAnchor.constraint(equalTo: labelArrangedView.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: labelArrangedView.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 15),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: statusTextField.trailingAnchor)
        ])
    }
    
    @objc func printStatus() {
        guard let textField = statusTextField.text, !textField.isEmpty
                
        else {
            shakeTextField()
            return
        }
        
        statusLabel.text = statusTextField.text
        statusTextField.text = ""
    }
    func shakeTextField() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = 0.6
        animation.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, -2.0, 2.0, 0.0]
        setStatusButton.layer.add(animation, forKey: "shake")
    }
}



extension ProfileTableHeaderView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return false
    }
}

extension ProfileTableHeaderView: UIGestureRecognizerDelegate {
    
    func setupTapGesture() {
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_:)))
        imageViewSnoopDog.addGestureRecognizer(tapGestureRecognizer)
        imageViewSnoopDog.isUserInteractionEnabled = true
    }
    
    @objc func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard tapGestureRecognizer === gestureRecognizer else { return }
        delegate?.delegateActionAnimatedAvatar(cell: self)
    }
}

