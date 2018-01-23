//
//  SignUpNurseVC.swift
//  HelpingHand
//
//  Created by amota511 on 12/29/17.
//  Copyright © 2017 Aaron Motayne. All rights reserved.
//

import UIKit

class SignUpNurseVC: UIViewController, UITextFieldDelegate {
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(28) //UIFont(name: "Lobster-Regular", size: 45)
        label.text = "Nurse Sign Up"
        label.textColor =  UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let inputsContainerView: UIView  = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.setTitle("Sign Up!", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 255.0, g: 160, b: 45), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.white
        button.setImage(#imageLiteral(resourceName: "back_icon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        return button
    }()
    
    lazy var nameTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Registered Nurse ID Number"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.returnKeyType = .next
        tf.delegate = self
        return tf
    }()
    
    let nameSeparatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 200, g: 200, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var emailTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.returnKeyType = .next
        tf.delegate = self
        return tf
    }()
    
    let emailSeparatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 200, g: 200, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var passwordTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.returnKeyType = .go
        tf.delegate = self
        return tf
    }()
    
    let passwordSeparatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 200, g: 200, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        handleLogin()
        return true
    }
    
    var name = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.addSubview(welcomeLabel)
        setwelcomeLabel()
        
        
        view.addSubview(inputsContainerView)
        view.addSubview(loginButton)
        view.addSubview(cancelButton)
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeparatorView)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeparatorView)
        inputsContainerView.addSubview(passwordTextField)
        inputsContainerView.addSubview(passwordSeparatorView)
        
        setInputContainerView()
        setLoginRegisterButton()
        setNameTextField()
        setNameSeparatorView()
        setEmailTextField()
        setEmailSeparatorView()
        setPasswordTextField()
        setPaswordSeparatorView()
        setCancelButton()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let tapOutsideOfTextField = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        self.view.addGestureRecognizer(tapOutsideOfTextField)
        
    }
    
    func setwelcomeLabel(){
        welcomeLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48).isActive = true
        welcomeLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5).isActive = true
        welcomeLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5).isActive = true
    }
    
    func setCancelButton() {
        cancelButton.leftAnchor.constraint(equalTo:view.leftAnchor, constant: 12).isActive = true
        cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/10).isActive = true
        cancelButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/10).isActive = true
    }
    
    @objc func handleCancel(){
        self.removeFromParentViewController()
        self.dismiss(animated: true, completion: nil)
    }
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    var inputsContainerViewYAnchor: NSLayoutConstraint?
    var loginButtonYAnchor: NSLayoutConstraint?
    
    func setInputContainerView(){
        //need x, y, width, height constraints
        inputsContainerView.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        inputsContainerView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 35).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo:view.widthAnchor,constant: -24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setLoginRegisterButton(){
        //need x, y, width, height constraints
        loginButton.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        loginButtonYAnchor = loginButton.topAnchor.constraint(equalTo:inputsContainerView.bottomAnchor, constant: 12)
        loginButtonYAnchor?.isActive = true
        loginButton.widthAnchor.constraint(equalTo:inputsContainerView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant:view.frame.height * 0.06833).isActive = true
        
    }
    
    @objc func handleLogin(){
        guard let email = emailTextField.text, let password = passwordTextField.text else{
            print("Form Is Not Valid")
            return
        }
        //        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
        //            if error != nil {
        //                print(error!)
        //                let invalidLoginCredentialsAlert = UIAlertController(title: "Something Went Wrong", message: "Could Not Login With This Information", preferredStyle: .alert)
        //                invalidLoginCredentialsAlert.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: { (UIAlertAction) in
        //                    invalidLoginCredentialsAlert.dismiss(animated:false, completion: nil)
        //                }))
        //                self.present(invalidLoginCredentialsAlert, animated: true, completion: nil)
        //                return
        //            }
        //            print("Successfully logged in user")
        //            self.performSegue(withIdentifier: "Login", sender: self)
        //        })
    }
    
    func setNameTextField(){
        nameTextField.leftAnchor.constraint(equalTo:inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo:inputsContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo:inputsContainerView.widthAnchor).isActive = true
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo:inputsContainerView.heightAnchor, multiplier: 1/3)
        nameTextFieldHeightAnchor?.isActive = true
    }
    
    func setNameSeparatorView(){
        nameSeparatorView.leftAnchor.constraint(equalTo:inputsContainerView.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo:nameTextField.bottomAnchor).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo:inputsContainerView.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant:1).isActive = true
    }
    
    func setEmailTextField(){
        emailTextField.leftAnchor.constraint(equalTo:inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo:nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo:inputsContainerView.widthAnchor).isActive = true
        
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo:inputsContainerView.heightAnchor, multiplier: 1/3)
        emailTextFieldHeightAnchor?.isActive = true
        
    }
    
    func setEmailSeparatorView(){
        emailSeparatorView.leftAnchor.constraint(equalTo:inputsContainerView.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo:emailTextField.bottomAnchor).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo:inputsContainerView.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant:1).isActive = true
        
    }
    
    func setPasswordTextField(){
        passwordTextField.leftAnchor.constraint(equalTo:inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo:emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo:inputsContainerView.widthAnchor).isActive = true
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo:inputsContainerView.heightAnchor, multiplier: 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
        
    }
    
    func setPaswordSeparatorView(){
        passwordSeparatorView.leftAnchor.constraint(equalTo:inputsContainerView.leftAnchor).isActive = true
        passwordSeparatorView.topAnchor.constraint(equalTo:passwordTextField.bottomAnchor).isActive = true
        passwordSeparatorView.widthAnchor.constraint(equalTo:inputsContainerView.widthAnchor).isActive = true
        passwordSeparatorView.heightAnchor.constraint(equalToConstant:1).isActive = true
        
    }
    
    @objc func dissmissKeyboard(){
        
        if emailTextField.isEditing || passwordTextField.isEditing {
            inputsContainerViewYAnchor?.isActive = false
            inputsContainerViewYAnchor = inputsContainerView.centerYAnchor.constraint(equalTo:view.centerYAnchor)
            inputsContainerViewYAnchor?.isActive = true
            emailTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
            
            UIView.animate(withDuration: 1.25, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.2, options: [.curveEaseOut], animations: {
                self.view.layoutIfNeeded()
            }) { (completed) in
                
            }
        }
    }
    
}
