//
//  ViewController.swift
//  FB
//
//  Created by Vardges Gasparyan on 2020-07-08.
//  Copyright © 2020 Vardges Gasparyan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LogInVC: UIViewController {

    let topView: UIView = {
       
        let view = UIView()
        view.clipsToBounds  = true
        view.backgroundColor = UIColor(red: 135/255, green: 180/255, blue: 255/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomView: UIView = {
       
        let view = UIView()
        view.clipsToBounds  = true
        view.backgroundColor = UIColor(red: 135/255, green: 180/255, blue: 255/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackView: UIStackView = {
       
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.fillEqually
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let logoImage: UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Facebook_logo")
        imageView.layer.masksToBounds = false
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowOffset = CGSize(width: -3, height: 3)
        imageView.layer.shadowRadius = 3
        return imageView
    }()
    
    let loginTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "enter user email:"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.borderStyle = .none
        return textField
    }()
    
    let passwordTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "enter user password:"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.keyboardType = UIKeyboardType.default
        textField.isSecureTextEntry = true
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    let logInButton: UIButton = {
       
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("login", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(loginButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    let registerButton: UIButton = {
       
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("register", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(registerButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    let forgotPassButton: UIButton = {
        
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("forgot password?", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(forgotPassButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupElements()
    }

    // *************************************** SetUp Elements ***************************************
    
    func setupElements() {
        
        self.view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        stackView.addArrangedSubview(topView)
        topView.topAnchor.constraint(equalTo: self.stackView.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor).isActive = true
        
        stackView.addArrangedSubview(bottomView)
        bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor).isActive = true
        
        topView.addSubview(logoImage)
        logoImage.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        logoImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        logoImage.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.5).isActive = true
        logoImage.widthAnchor.constraint(equalTo: logoImage.heightAnchor).isActive = true
        
        bottomView.addSubview(loginTextField)
        Style.styleTextField(loginTextField)
        loginTextField.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        loginTextField.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.65).isActive = true
        loginTextField.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 43).isActive = true

        bottomView.addSubview(passwordTextField)
        Style.styleTextField(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: loginTextField.widthAnchor).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: loginTextField.heightAnchor).isActive = true
        
        bottomView.addSubview(logInButton)
        Style.styleFilledButton(logInButton)
        logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 43).isActive = true
        logInButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.3).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        
        bottomView.addSubview(registerButton)
        Style.styleHollowButton(registerButton)
        registerButton.heightAnchor.constraint(equalTo: logInButton.heightAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalTo: logInButton.widthAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: logInButton.topAnchor).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        
        bottomView.addSubview(forgotPassButton)
        Style.asStrokeButton(forgotPassButton)
        forgotPassButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        forgotPassButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 20).isActive = true
        forgotPassButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.4).isActive = true
        forgotPassButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        // call the 'keyboardWillShow' function when the view controller receive the notification that a keyboard is going to be shown
        NotificationCenter.default.addObserver(self, selector: #selector(LogInVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        // call the 'keyboardWillHide' function when the view controlelr receive notification that keyboard is going to be hidden
        NotificationCenter.default.addObserver(self, selector: #selector(LogInVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.loginTextField.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        self.passwordTextField.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))

        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
        
        // Keyboard shift View
        
        @objc func keyboardWillShow(notification: NSNotification) {

            guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
               // if keyboard size is not available for some reason, dont do anything
               return
            }

          // move the root view up by the distance of keyboard height
          self.view.frame.origin.y = 0 - (keyboardSize.height / 4)
        }

        @objc func keyboardWillHide(notification: NSNotification) {
          // move back the root view origin to zero
          self.view.frame.origin.y = 0
        }
        
    // ************************************** Keyboard Extend Button **************************************
        
        @objc func tapDone(sender: Any) {

            self.view.endEditing(true)
        }

        
    // ********************************** If user signed in ***************************************
        
        override func viewDidAppear(_ animated: Bool){
        
        if Auth.auth().currentUser != nil {
            
          // User is signed in.
            let homeVC = self.storyboard?.instantiateViewController(identifier: Storyboards.homeViewController) as? HomeVC
            
            self.view.window?.rootViewController = homeVC
            self.view.window?.makeKeyAndVisible()
        } else {
          // No user is signed in.
            
            return
        }}
    
    // ********************************* Bitton Actions ******************************************
    
    @objc func registerButtonTapped() {
        
        let registerVC = self.storyboard?.instantiateViewController(identifier: Storyboards.registerViewController) as? RegisterVC
        
        self.view.window?.rootViewController = registerVC
        self.view.window?.makeKeyAndVisible()
    }
    
    @objc func loginButtonTapped() {
        
        let email = loginTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                
                let alert = UIAlertController(title: "Error!!!", message: error?.localizedDescription, preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { acion in
                
                }))
                
                self.present(alert, animated: true)
            } else {
                
                let homeVC = self.storyboard?.instantiateViewController(identifier: Storyboards.homeViewController) as? HomeVC
                
                self.view.window?.rootViewController = homeVC
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    @objc func forgotPassButtonTapped() {

        Auth.auth().sendPasswordReset(withEmail: loginTextField.text!) { error in
            // Your code here
            if error != nil {
                
                let alert = UIAlertController(title: "Error!!! Email field is empty", message: error!.localizedDescription, preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { acion in
                
                }))
                self.present(alert, animated: true)
            } else {
                
                let alert = UIAlertController(title: "Request is successfull!!!", message: "Please check your email", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { acion in
                
                }))
                
                self.present(alert, animated: true)
            }
        }
    }
}

