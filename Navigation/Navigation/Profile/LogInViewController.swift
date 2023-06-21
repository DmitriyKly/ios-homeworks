//
//  LogInViewController.swift
//  Navigation
//
//  Created by dmitriy on 20/6/2023.
//

import UIKit

class LoginViewController: UIViewController{

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
                
        return passwordField
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
    
     lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .systemBrown
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       removeKeyboardObservers()
    }
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupView()
        setupConstraintsLogin()
        // self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupView() {
        view.addSubview(imageViewVk)
        view.addSubview(fieldContainer)
        fieldContainer.addSubview(mailOfPhoneField)
        fieldContainer.addSubview(passwordField)
        view.addSubview(logInButton)
        view.addSubview(scrollView)
        //scrollView.addSubview(view)
    }
    
    func setupConstraintsLogin() {
        NSLayoutConstraint.activate([
            imageViewVk.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageViewVk.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            imageViewVk.heightAnchor.constraint(equalToConstant: 100),
            imageViewVk.widthAnchor.constraint(equalToConstant: 100),
            
            fieldContainer.topAnchor.constraint(equalTo: imageViewVk.bottomAnchor, constant: 120),
            fieldContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            fieldContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            fieldContainer.heightAnchor.constraint(equalToConstant: 100),
            
            mailOfPhoneField.topAnchor.constraint(equalTo: imageViewVk.bottomAnchor, constant: 120),
            mailOfPhoneField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mailOfPhoneField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mailOfPhoneField.heightAnchor.constraint(equalToConstant: 50),
        
            passwordField.topAnchor.constraint(equalTo: mailOfPhoneField.bottomAnchor, constant: 0),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.topAnchor.constraint(equalTo: fieldContainer.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 49),
            
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 16.0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    @objc func showProfileViewController() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
     func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
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


