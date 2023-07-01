//
//  LogInViewController.swift
//  Navigation
//
//  Created by dmitriy on 20/6/2023.
//

import UIKit

class LoginViewController: UIViewController{

    let notificationCenter = NotificationCenter.default
    
    let minimumPasswordLength = 6
    
    let standartUsername = "admin"
    
    let standartPassword = "password"
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    lazy var imageViewVk: UIImageView = {
         let imageViewVk = UIImageView()
        imageViewVk.image = UIImage(named: "VK")
        imageViewVk.contentMode = .scaleAspectFill
        imageViewVk.translatesAutoresizingMaskIntoConstraints = false

         return imageViewVk
     }()
    
    lazy var fieldContainer : UIView = {
        let fieldContainer = UIView()
        fieldContainer.backgroundColor = UIColor.systemGray6
        fieldContainer.layer.cornerRadius = 10
        fieldContainer.translatesAutoresizingMaskIntoConstraints = false
        fieldContainer.layer.borderWidth = 0.5
        fieldContainer.layer.borderColor = UIColor.lightGray.cgColor
        fieldContainer.clipsToBounds = true
     
        return fieldContainer
    }()

    lazy var mailOfPhoneField: UITextField = {
          let mailOfPhoneField = UITextField()
        mailOfPhoneField.textColor = UIColor.black
        mailOfPhoneField.layer.borderWidth = 0.5
        mailOfPhoneField.layer.borderColor = UIColor.lightGray.cgColor
        mailOfPhoneField.font = UIFont.systemFont(ofSize: 16)
        mailOfPhoneField.translatesAutoresizingMaskIntoConstraints = false
        mailOfPhoneField.tintColor = UIColor(named: "MyColor")
        mailOfPhoneField.autocorrectionType = .no
        mailOfPhoneField.placeholder = "Email of phone"
        mailOfPhoneField.indent(size: 16)
        mailOfPhoneField.delegate = self
        
        return mailOfPhoneField
      }()
    
    lazy var passwordField: UITextField = {
          let passwordField = UITextField()
        passwordField.textColor = UIColor.black
        passwordField.font = UIFont.systemFont(ofSize: 16)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.tintColor = UIColor(named: "MyColor")
        passwordField.autocorrectionType = .no
        passwordField.placeholder = "Password"
        passwordField.indent(size: 16)
        passwordField.isSecureTextEntry = true
        passwordField.delegate = self
        passwordField.addTarget(self, action: #selector(ChecktextField), for: .editingChanged)
                
        return passwordField
      }()
    
    lazy var passwordWarningLabel: UILabel = {
        let passwordWarningLabel = UILabel()
        passwordWarningLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordWarningLabel.text = "Не достаточно символов"
        passwordWarningLabel.isHidden = true
        return passwordWarningLabel
    }()
    
    lazy var logInButton: UIButton = {
          let logInButton = UIButton(type: .system)
        logInButton.layer.cornerRadius = 10
        logInButton.setTitle("Log in", for: .normal)
        logInButton.tintColor = .white
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        logInButton.clipsToBounds = true
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        logInButton.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.8), for: .highlighted)
        logInButton.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.8), for: .selected)
        logInButton.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.8), for: .disabled)
        logInButton.addTarget(self, action: #selector(showProfileViewController), for: .touchUpInside)
        
        return logInButton
      }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupView()
        setupConstraintsLogin()
        self.navigationController?.navigationBar.isHidden = true
}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height + logInButton.frame.height + 16
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + logInButton.frame.height + 16, right: 0)
        }
    }
     
    @objc private func keyboardWillHide() {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageViewVk)
        contentView.addSubview(fieldContainer)
        contentView.addSubview(logInButton)
        fieldContainer.addSubview(mailOfPhoneField)
        fieldContainer.addSubview(passwordField)
        contentView.addSubview(passwordWarningLabel)
 
    }
    
    func setupConstraintsLogin() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageViewVk.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageViewVk.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            imageViewVk.heightAnchor.constraint(equalToConstant: 100),
            imageViewVk.widthAnchor.constraint(equalToConstant: 100),
            
            fieldContainer.topAnchor.constraint(equalTo: imageViewVk.bottomAnchor, constant: 120),
            fieldContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            fieldContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            fieldContainer.heightAnchor.constraint(equalToConstant: 100),
            
            mailOfPhoneField.topAnchor.constraint(equalTo: imageViewVk.bottomAnchor, constant: 120),
            mailOfPhoneField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mailOfPhoneField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mailOfPhoneField.heightAnchor.constraint(equalToConstant: 50),
        
            passwordField.topAnchor.constraint(equalTo: mailOfPhoneField.bottomAnchor, constant: 0),
            passwordField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordWarningLabel.topAnchor.constraint(equalTo: fieldContainer.bottomAnchor, constant: 6),
            passwordWarningLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordWarningLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      
            logInButton.topAnchor.constraint(equalTo: passwordWarningLabel.bottomAnchor, constant: 12),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 49),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func shakeTextField() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = 0.6
        animation.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, -2.0, 2.0, 0.0]
        contentView.layer.add(animation, forKey: "shake")
    }
    
    
        func checkCredentials() {
                let alert = UIAlertController(title: "Ошибка", message: "Неправильный логин или пароль", preferredStyle: .alert)
    
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
    
                alert.addAction(ok)
    
                self.present(alert, animated: true, completion: nil)
            }
        

    
    @objc func showProfileViewController() {
        guard let mailText = mailOfPhoneField.text, !mailText.isEmpty

        else {
            shakeTextField()
            return
        }
        guard let passText = passwordField.text, !passText.isEmpty
        
        else {
            shakeTextField()
            return
        }
        
        guard passwordWarningLabel.isHidden != false
                
        else {
            shakeTextField()
            return
        }
         
        guard let username = mailOfPhoneField.text, let password = passwordField.text
        
        else {
            return
        }
        
        if username != standartUsername && password != standartPassword {
            checkCredentials()
        }
        
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
        
    @objc func ChecktextField(_ textField: UITextField) {
        if let password = textField.text {
            // Проверяем длину пароля
            if password.count < minimumPasswordLength {
                passwordWarningLabel.isHidden = false
            } else {
                passwordWarningLabel.isHidden = true
            }
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField ) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
}
    
extension UITextField {
    func indent (size: CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.midX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}


