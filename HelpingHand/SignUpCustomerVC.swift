//
//  SignUpCustomerVC.swift
//  HelpingHand
//
//  Created by amota511 on 12/28/17.
//  Copyright © 2017 Aaron Motayne. All rights reserved.
//

import UIKit

class SignUpCustomerVC:  UIViewController, UITextFieldDelegate {
    
    lazy var loginRegisterSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["You", "A Loved One"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = UIColor.white
        sc.setTitleTextAttributes(["Color": "White"], for: .normal)
        sc.selectedSegmentIndex = 1
        sc.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        return sc
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
        tf.placeholder = "Your Loved One's Name"
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
        tf.placeholder = "Your Email"
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
    
    let refridgerdata: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "Who Needs Care?"
        label.textColor =  UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    func textFieldShouldBeginEditing(_ state: UITextField) -> Bool {
        inputsContainerViewYAnchor?.isActive = false
        inputsContainerViewYAnchor = inputsContainerView.topAnchor.constraint(equalTo: refridgerdata.bottomAnchor, constant: 35)
        inputsContainerViewYAnchor?.isActive = true
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.2, options: [.curveEaseOut], animations: {
            self.view.layoutIfNeeded()
        }) { (completed) in
            
        }
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        handleLogin()
        return true
    }
    
    var name = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.addSubview(refridgerdata)
        setRefridgerdata()
 
        view.addSubview(loginRegisterSegmentedControl)
        view.addSubview(inputsContainerView)
        view.addSubview(loginButton)
        view.addSubview(cancelButton)
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeparatorView)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeparatorView)
        inputsContainerView.addSubview(passwordTextField)
        inputsContainerView.addSubview(passwordSeparatorView)
        
        setloginRegisterSegmentedControl()
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
    
    
    
    func setRefridgerdata(){
        
        refridgerdata.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        refridgerdata.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        refridgerdata.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5).isActive = true
        refridgerdata.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5).isActive = true
    }
    
    func setloginRegisterSegmentedControl() {
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        loginRegisterSegmentedControlYAnchor = loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo:inputsContainerView.topAnchor, constant: -12)
        loginRegisterSegmentedControlYAnchor?.isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo:inputsContainerView.widthAnchor).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant:view.frame.height * 0.06833).isActive = true
    }
    
    func setCancelButton() {
        cancelButton.leftAnchor.constraint(equalTo:view.leftAnchor, constant: 12).isActive = true
        cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/10).isActive = true
        cancelButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/10).isActive = true
    }
    
    @objc func handleCancel(){
        //self.view = nil
        self.removeFromParentViewController()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleLoginRegisterChange(){

        //Change Height of inputContainerView
        inputsContainerViewHeightAnchor?.constant
            = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 100 : 150
        
        //Change height of nameTextField
        nameTextFieldHeightAnchor?.isActive = false
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        nameTextFieldHeightAnchor?.isActive = true
        
        //Hack to fix name placeholder issue.
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0{
            nameTextField.placeholder = ""
            name = nameTextField.text!
            nameTextField.text = ""
        }else {
            nameTextField.placeholder = "Your Loved One's Name"
            nameTextField.text! = name
        }
        
        emailTextFieldHeightAnchor?.isActive = false
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo:inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        emailTextFieldHeightAnchor?.isActive = true
        
        passwordTextFieldHeightAnchor?.isActive = false
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo:inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
    }
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    var inputsContainerViewYAnchor: NSLayoutConstraint?
    var loginRegisterSegmentedControlYAnchor : NSLayoutConstraint?
    var loginButtonYAnchor: NSLayoutConstraint?
    
    func setInputContainerView(){
        //need x, y, width, height constraints
        inputsContainerView.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        inputsContainerViewYAnchor = inputsContainerView.centerYAnchor.constraint(equalTo:view.centerYAnchor)
        inputsContainerViewYAnchor?.isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo:view.widthAnchor,constant: -24).isActive = true
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.205)
        inputsContainerViewHeightAnchor?.isActive = true
    }
    
    func setLoginRegisterButton(){
        //need x, y, width, height constraints
        loginButton.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        loginButtonYAnchor = loginButton.topAnchor.constraint(equalTo:inputsContainerView.bottomAnchor, constant: 12)
        loginButtonYAnchor?.isActive = true
        loginButton.widthAnchor.constraint(equalTo:inputsContainerView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant:view.frame.height * 0.06833).isActive = true
        
    }
    
    @objc func handleLogin() {
        performSegue(withIdentifier: "SignUpCustHomeSegue", sender: self)
    }
    
    func setNameTextField() {
        
        nameTextField.leftAnchor.constraint(equalTo:inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo:inputsContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo:inputsContainerView.widthAnchor).isActive = true
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo:inputsContainerView.heightAnchor, multiplier: 1/3)
        nameTextFieldHeightAnchor?.isActive = true
    }
    
    func setNameSeparatorView() {
        nameSeparatorView.leftAnchor.constraint(equalTo:inputsContainerView.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo:nameTextField.bottomAnchor).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo:inputsContainerView.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant:1).isActive = true
    }
    
    func setEmailTextField() {
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
        
        if nameTextField.isEditing || emailTextField.isEditing || passwordTextField.isEditing {
            inputsContainerViewYAnchor?.isActive = false
            inputsContainerViewYAnchor = inputsContainerView.centerYAnchor.constraint(equalTo:view.centerYAnchor)
            inputsContainerViewYAnchor?.isActive = true
            nameTextField.resignFirstResponder()
            emailTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
            
            UIView.animate(withDuration: 1.25, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.2, options: [.curveEaseOut], animations: {
                self.view.layoutIfNeeded()
            }) { (completed) in
                
            }
        }
    }
 
}
