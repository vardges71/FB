//
//  RegisterVC.swift
//  FB
//
//  Created by Vardges Gasparyan on 2020-07-08.
//  Copyright © 2020 Vardges Gasparyan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class RegisterVC: UIViewController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get{
            return .portrait
        }
    }
    
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
        stackView.distribution = UIStackView.Distribution.fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let emailTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "enter your email:"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.borderStyle = .none
        return textField
    }()
    
    let firstNameTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "enter your first name:"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.borderStyle = .none
        return textField
    }()
    
    let lastNameTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "enter your last name:"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.borderStyle = .none
        return textField
    }()
    
    let passwordTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "enter your password:"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.keyboardType = UIKeyboardType.default
        textField.isSecureTextEntry = true
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    let rePasswordTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "re-enter your password:"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.keyboardType = UIKeyboardType.default
        textField.isSecureTextEntry = true
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
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
    
    let cancelButton: UIButton = {
       
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("cancel", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(cancelButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupElements()
    }

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
        topView.heightAnchor.constraint(equalTo: self.stackView.heightAnchor, multiplier: 0.5).isActive = true
        
        stackView.addArrangedSubview(bottomView)
        bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: self.stackView.heightAnchor, multiplier: 0.5).isActive = true
        
        topView.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: topView.topAnchor, constant: 60).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.65).isActive = true
        emailTextField.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 43).isActive = true
        
        topView.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.65).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 43).isActive = true
        
        topView.addSubview(rePasswordTextField)
        rePasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        rePasswordTextField.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        rePasswordTextField.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.65).isActive = true
        rePasswordTextField.heightAnchor.constraint(equalToConstant: 43).isActive = true
        
        topView.addSubview(firstNameTextField)
        firstNameTextField.topAnchor.constraint(equalTo: rePasswordTextField.bottomAnchor, constant: 10).isActive = true
        firstNameTextField.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        firstNameTextField.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.65).isActive = true
        firstNameTextField.heightAnchor.constraint(equalToConstant: 43).isActive = true
        
        topView.addSubview(lastNameTextField)
        lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 10).isActive = true
        lastNameTextField.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        lastNameTextField.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.65).isActive = true
        lastNameTextField.heightAnchor.constraint(equalToConstant: 43).isActive = true
        
        bottomView.addSubview(registerButton)
        Style.styleFilledButton(registerButton)
        registerButton.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: lastNameTextField.leadingAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.3).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 43).isActive = true
        
        bottomView.addSubview(cancelButton)
        Style.styleHollowButton(cancelButton)
        cancelButton.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: lastNameTextField.trailingAnchor).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.3).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 43).isActive = true
        
        
//        // call the 'keyboardWillShow' function when the view controller receive the notification that a keyboard is going to be shown
//        NotificationCenter.default.addObserver(self, selector: #selector(RegisterVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        // call the 'keyboardWillHide' function when the view controlelr receive notification that keyboard is going to be hidden
//        NotificationCenter.default.addObserver(self, selector: #selector(RegisterVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.emailTextField.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        self.passwordTextField.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        self.rePasswordTextField.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        self.firstNameTextField.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        self.lastNameTextField.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))

        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // **************************************** Keyboard shift View ***************************************
        
//        @objc func keyboardWillShow(notification: NSNotification) {
//
//            guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
//          // if keyboard size is not available for some reason, dont do anything
//               return
//            }
//          // move the root view up by the distance of keyboard height
//            self.view.frame.origin.y = 0 - (keyboardSize.height / 4)
//        }
//
//        @objc func keyboardWillHide(notification: NSNotification) {
//          // move back the root view origin to zero
//            self.view.frame.origin.y = 0
//        }
        
    // ************************************** Keyboard Extend Button **************************************
        
    @objc func tapDone(sender: Any) {

        self.view.endEditing(true)
    }
    
    // ************************************** Button Actions **********************************************
    
    @objc func registerButtonTapped() {
        
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
        // There's something wrong with the fields, show error message
            print(error!)
        } else {
        
            // Create cleaned version of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
            let user = FBUser(firstName: firstName, lastName: lastName, email: email)
            
            // Create the User
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                if err != nil {
                    
                    // There was an error creating the user
                    
                    let alert = UIAlertController(title: "Error!!!", message: "Error creatimg the user", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { acion in
                        
                    }))
                        
                    self.present(alert, animated: true)
                } else {
                    
                    // User was created successfully, now store the first name and the last name
                    let db: DatabaseReference!
                    db = Database.database().reference(withPath: "users").child(result!.user.uid).child("credentials")
                    
                    db.setValue(["firstname" : user.firstName, "lastname" : user.lastName, "email" : user.email]) { (result, err) in

                        if error != nil {

                    //Show erroe message
                        let alert = UIAlertController(title: "Error!!!", message: "Error saving user data", preferredStyle: .alert)

                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { acion in
                            
                        }))
                            
                        self.present(alert, animated: true)
                        }
                    }
                    
                    // Transition to the home screen
                    let homeVC = self.storyboard?.instantiateViewController(identifier: Storyboards.homeViewController) as? HomeVC
                    
                    self.view.window?.rootViewController = homeVC
                    self.view.window?.makeKeyAndVisible()
                    
                    print("Register Success")
                }
            }
        }
    }
    
    @objc func cancelButtonTapped() {
        
        let loginVC = self.storyboard?.instantiateViewController(identifier: Storyboards.loginViewController) as? LogInVC
        
        self.view.window?.rootViewController = loginVC
        self.view.window?.makeKeyAndVisible()
    }
    
    // ************************************** Validation Fields *******************************************
    
    // Check the fields and validate that the data is correct. If everything is correct, this methods returns nil. Othervise, it returns the error message
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "please fill in all fields"
        }
        
        // Check that password field equals rePassword text fild
        if passwordTextField.text! != rePasswordTextField.text! {
            
            return "please enter the same passwords in the passwors and rePassword fields"
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            
            // Password isn't secure enogh
            return "Please make sure your password is at least 8 characters, contains a special character and number"
        }
        
        return nil
    }
}
