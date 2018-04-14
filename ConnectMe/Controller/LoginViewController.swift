//
//  LoginViewController.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-01-15.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    let logoImageView : UIImageView = {
        let logoImage = UIImageView(image: #imageLiteral(resourceName: "logo"))
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.adjustsImageSizeForAccessibilityContentSizeCategory = true
        return logoImage
    }()
    
    
    let usernameTextField : ConnectMeTextField = {
        let usernameText = ConnectMeTextField()
        usernameText.placeholder = "Username"
        usernameText.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedStringKey.foregroundColor: ConnectMeConstants.connectMeColours.lightBlueColour])
        return usernameText
    }()
    
    let passwordTextField : ConnectMeTextField = {
        let passwordText = ConnectMeTextField()
        passwordText.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: ConnectMeConstants.connectMeColours.lightBlueColour])
        passwordText.isSecureTextEntry = true
        return passwordText
    }()
    
    let loginButton : LoginButton = {
        let login = LoginButton()
        login.setTitle("Login", for: .normal)
        login.buttonTapped()  //figure out how to transition the view controllers
        return login
    }()
    
    let forgotPasswordButton : UIButton = {
        let forgotPassword = UIButton()
        forgotPassword.setTitle("Forgot Your Password?", for: .normal)
        forgotPassword.translatesAutoresizingMaskIntoConstraints = false
        forgotPassword.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        forgotPassword.setTitleColor(.white, for: .normal)
        return forgotPassword
    }()
    
    let facebookLogin : UIButton = {
        let facebookLoginButton = UIButton()
        facebookLoginButton.setTitle("Login With Facebook", for: .normal)
        facebookLoginButton.backgroundColor = .blue
        facebookLoginButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        facebookLoginButton.translatesAutoresizingMaskIntoConstraints = false
        facebookLoginButton.setTitleColor(.white, for: .normal)
        facebookLoginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        return facebookLoginButton
    }()
    
    let dontHaveAccount : UILabel = {
        let dontHave = UILabel()
        dontHave.text = "Don't Have An Account?"
        dontHave.font = UIFont.systemFont(ofSize: 12)
        dontHave.textColor = .white
        dontHave.font.withSize(50)
        dontHave.translatesAutoresizingMaskIntoConstraints = false
        return dontHave
    }()
    
    let signupNow : UIButton = {
        let signupNowButton = UIButton()
        signupNowButton.setTitle("Sign Up Now", for: .normal)
        signupNowButton.translatesAutoresizingMaskIntoConstraints = false
        signupNowButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        signupNowButton.setTitleColor(ConnectMeConstants.connectMeColours.lightBlueColour, for: .normal)
            signupNowButton.addTarget(self, action: #selector(pushToSignup), for: .touchUpInside)
        return signupNowButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(logoImageView)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        self.view.addSubview(forgotPasswordButton)
        self.view.addSubview(facebookLogin)
        self.view.addSubview(dontHaveAccount)
        self.view.addSubview(signupNow)
        self.setupLogoLayout()
        self.setupLayoutTextFields()
        self.setupButtonLayout()
        self.setupLabelLayout()
        
        let background = CAGradientLayer().backgroundColour()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, at: 0)
       
//        receive notif and call func
        NotificationCenter.default.addObserver(self, selector: #selector(pushToHomeVC(notif:)), name: NSNotification.Name(rawValue: "pushToHomeFromLogin"), object: nil)
        
    }
    
    @objc func pushToHomeVC(notif: NSNotification) {
        let homeController = HomePageViewController()
        navigationController?.pushViewController(homeController, animated: true)
    }
    
    @objc func pushToSignup() {
        let signupController = SignupViewController()
        navigationController?.pushViewController(signupController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
    //CONSTRAINTS
    
    private func setupLogoLayout() {
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }
    
    private func setupLayoutTextFields () {
        usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let trailingUsername = NSLayoutConstraint(item: usernameTextField,
                                                  attribute: .trailing,
                                                  relatedBy: .equal,
                                                  toItem: self.view,
                                                  attribute: .trailing,
                                                  multiplier: 1, constant: -80)
        trailingUsername.isActive = true
        let leadingUsername = NSLayoutConstraint(item: usernameTextField,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: self.view,
                                                 attribute: .leading,
                                                 multiplier: 1, constant: 70)
        leadingUsername.isActive = true
        usernameTextField.setBottomBorder()
        
        
        
        let passwordYaxis = passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80) //make it constrain from username instead of center?
        passwordYaxis.isActive = true
        let passwordTrailing = NSLayoutConstraint(item: passwordTextField,
                                                  attribute: .trailing,
                                                  relatedBy: .equal,
                                                  toItem: self.view,
                                                  attribute: .trailing,
                                                  multiplier: 1, constant: -80)
        passwordTrailing.isActive = true
        let passwordLeading = NSLayoutConstraint(item: passwordTextField,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: self.view,
                                                 attribute: .leading,
                                                 multiplier: 1, constant: 70)
        passwordLeading.isActive = true
        passwordTextField.setBottomBorderPas()
    }
    private func setupButtonLayout() {
        let loginButtonYaxis = NSLayoutConstraint(item: loginButton,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: passwordTextField,
                                                  attribute: .top,
                                                  multiplier: 1,
                                                  constant: 50)
        loginButtonYaxis.isActive = true
        
        let loginButtonTrailing = NSLayoutConstraint(item: loginButton,
                                                     attribute: .trailing,
                                                     relatedBy: .equal,
                                                     toItem: self.view,
                                                     attribute: .trailing,
                                                     multiplier: 1, constant: -200)
        loginButtonTrailing.isActive = true
        
        let loginButtonLeading = NSLayoutConstraint(item: loginButton,
                                                    attribute: .leadingMargin,
                                                    relatedBy: .equal,
                                                    toItem: self.view,
                                                    attribute: .leading,
                                                    multiplier: 1, constant: 70)
        loginButtonLeading.isActive = true
        
        
        
        let forgotButtonYaxis = NSLayoutConstraint(item: forgotPasswordButton,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: loginButton,
                                                   attribute: .top,
                                                   multiplier: 1,
                                                   constant: 40)
        forgotButtonYaxis.isActive = true
        let forgotButtonTrailing = NSLayoutConstraint(item: forgotPasswordButton,
                                                      attribute: .trailing,
                                                      relatedBy: .equal,
                                                      toItem: self.view,
                                                      attribute: .trailing,
                                                      multiplier: 1, constant: -150)
        forgotButtonTrailing.isActive = true
        
        let forgotButtonLeading = NSLayoutConstraint(item: forgotPasswordButton,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: self.view,
                                                     attribute: .leading,
                                                     multiplier: 1, constant: 70)
        forgotButtonLeading.isActive = true
        
        
        
        let facebookYaxis = NSLayoutConstraint(item: facebookLogin,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: forgotPasswordButton,
                                               attribute: .top,
                                               multiplier: 1,
                                               constant: 40)
        facebookYaxis.isActive = true
        
        
        let facebookTrailing = NSLayoutConstraint(item: facebookLogin,
                                                  attribute: .trailing,
                                                  relatedBy: .equal,
                                                  toItem: self.view,
                                                  attribute: .trailing,
                                                  multiplier: 1, constant: -100)
        facebookTrailing.isActive = true
        let facebookLeading = NSLayoutConstraint(item: facebookLogin,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: self.view,
                                                 attribute: .leading,
                                                 multiplier: 1, constant: 70)
        facebookLeading.isActive = true
        
        let signupXaxis = signupNow.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        signupXaxis.isActive = true
        
        let signupYaxis = NSLayoutConstraint(item: signupNow,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: dontHaveAccount,
                                            attribute: .top,
                                            multiplier: 1,
                                            constant: 20)
        signupYaxis.isActive = true
        
    }
    
    private func setupLabelLayout() {
        let xAnchor = dontHaveAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        xAnchor.isActive = true
        
        let labelYaxis = NSLayoutConstraint(item: dontHaveAccount,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: facebookLogin,
                                               attribute: .top,
                                               multiplier: 1,
                                               constant: 70)
        labelYaxis.isActive = true
    }
}



