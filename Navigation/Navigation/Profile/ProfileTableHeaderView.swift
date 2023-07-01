//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by dmitriy on 8/6/2023.
//

import UIKit
class ProfileHeaderView: UIView {
    

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
    
    private let avatarWrapView: UIView = {
        let avatarWrapView = UIView()
        avatarWrapView.translatesAutoresizingMaskIntoConstraints = false
        return avatarWrapView
    }()
    
    private let blackBackground: UIView = {
        let blackBackground = UIView()
        blackBackground.translatesAutoresizingMaskIntoConstraints = false
        blackBackground.backgroundColor = .black
        blackBackground.layer.opacity = 0.5
        blackBackground.isHidden = true
        return blackBackground
    }()
    
    private lazy var imageViewSnoopDog: UIImageView = {
        let imageViewSnoopDog = UIImageView()
          imageViewSnoopDog.image = UIImage(named: "Snoop dog")
          imageViewSnoopDog.contentMode = .scaleAspectFill
          imageViewSnoopDog.clipsToBounds = true
          imageViewSnoopDog.translatesAutoresizingMaskIntoConstraints = false
          imageViewSnoopDog.layer.cornerRadius = 50
          imageViewSnoopDog.layer.borderColor = UIColor.white.cgColor
          imageViewSnoopDog.layer.borderWidth = 3
          imageViewSnoopDog.isUserInteractionEnabled = true
          imageViewSnoopDog.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
  
          return imageViewSnoopDog
    }()
    
    private lazy var closeAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image =  UIImage(systemName: "xmark.circle")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.layer.opacity = 0
        imageView.tintColor = .white
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCloseGesture)))
        return imageView
    }()
    
    lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Snoop Dog"
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        fullNameLabel.textColor = UIColor.black
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return fullNameLabel
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
    
    private var leadingImageView = NSLayoutConstraint()
    private var trailingImageView = NSLayoutConstraint()
    private var topImageView = NSLayoutConstraint()
    private var widthImageView = NSLayoutConstraint()
    private var heightImageView = NSLayoutConstraint()
    private var heightWrapView = NSLayoutConstraint()
    
    //MARK: - inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addButtons()
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Functions
    
    private func addSubviews(){
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        addSubview(avatarWrapView)
        addSubview(blackBackground)
        addSubview(imageViewSnoopDog)
        addSubview(closeAvatar)
    }
    
    private func addButtons() {
        setStatusButton.addTarget(self, action: #selector(printStatus), for: .touchUpInside)
        
    }
    
    //MARK: - Constraints
    
    private func setupContraints() {
        
        //                  imageViewSnoopDog
        leadingImageView = imageViewSnoopDog.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        topImageView = imageViewSnoopDog.topAnchor.constraint(equalTo: topAnchor,constant: 16)
        widthImageView = imageViewSnoopDog.widthAnchor.constraint(equalToConstant: 95)
        heightImageView = imageViewSnoopDog.heightAnchor.constraint(equalToConstant: 95)
        NSLayoutConstraint.activate([leadingImageView, topImageView, widthImageView, heightImageView])
        
        //                  wrapView
        heightWrapView = blackBackground.heightAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([heightWrapView])
        
        NSLayoutConstraint.activate([
            
            
            
            blackBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            blackBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            blackBackground.topAnchor.constraint(equalTo: topAnchor),
            
            closeAvatar.widthAnchor.constraint(equalToConstant: 30),
            closeAvatar.heightAnchor.constraint(equalToConstant: 30),
            closeAvatar.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            closeAvatar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            avatarWrapView.widthAnchor.constraint(equalToConstant: 95),
            avatarWrapView.heightAnchor.constraint(equalToConstant: 95),
            avatarWrapView.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            avatarWrapView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            
            fullNameLabel.widthAnchor.constraint(equalToConstant: 100),
            fullNameLabel.topAnchor.constraint(equalTo: avatarWrapView.topAnchor ,constant: 0),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarWrapView.trailingAnchor,constant: 20),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor,constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            
            statusTextField.widthAnchor.constraint(equalTo: statusLabel.widthAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 50),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 15),
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 15),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: statusTextField.trailingAnchor)
        ])
    }
    
    @objc func printStatus() {
        statusLabel.text = statusTextField.text
        statusTextField.text = ""
    }
    
    @objc private func tapAction() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.6) {
                
                self.widthImageView.constant = UIScreen.main.bounds.width - 60
                self.leadingImageView.constant = 30
                self.trailingImageView.constant = 30
                self.topImageView.constant = 30
                self.heightImageView.constant = UIScreen.main.bounds.height - 220
                self.heightWrapView.constant =  UIScreen.main.bounds.height
                self.imageViewSnoopDog.layer.cornerRadius = 0
                self.blackBackground.isHidden = false
            }
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.8) {
                self.closeAvatar.layer.opacity = 1
                self.blackBackground.layer.opacity = 0.3

            }
        }
        
    }
    
    @objc private func tapCloseGesture() {
        
        UIView.animateKeyframes(withDuration: 0.4, delay: 0) {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.closeAvatar.layer.opacity = 0
                self.blackBackground.layer.opacity = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.blackBackground.isHidden = false
                self.blackBackground.isHidden = true
                self.imageViewSnoopDog.layer.cornerRadius = 50
                self.widthImageView.constant = 95
                self.leadingImageView.constant = 16
                self.trailingImageView.constant = 30
                self.topImageView.constant = 16
                self.heightImageView.constant = 95
                self.heightWrapView.constant =  UIScreen.main.bounds.height
            }
        }
    }
}
