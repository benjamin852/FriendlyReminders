//
//  SignupViewController.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-04-08.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    let topBanner : UILabel = {
        let banner = UILabel()
        banner.text = "Start Receiving Friendly Reminders Today!"
        banner.textColor = ConnectMeConstants.connectMeColours.lightBlueColour
        banner.font = UIFont.boldSystemFont(ofSize: 50)
        banner.translatesAutoresizingMaskIntoConstraints = false
        banner.numberOfLines = 3
        banner.adjustsFontSizeToFitWidth = true
        return banner
    }()
    
    //will be replaced this is just a look a like to simulat real button
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
    
    
    let emailInput : ConnectMeTextField = {
        let usernameText = ConnectMeTextField()
        usernameText.placeholder = "Email"
        usernameText.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor: ConnectMeConstants.connectMeColours.lightBlueColour])
        return usernameText
    }()
    
    let passwordInput : ConnectMeTextField = {
        let passwordText = ConnectMeTextField()
        passwordText.placeholder = "Password"
        passwordText.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: ConnectMeConstants.connectMeColours.lightBlueColour])
        passwordText.isSecureTextEntry = true
        return passwordText
    }()
    
    let confirmPasswordInput : ConnectMeTextField = {
        let passwordText = ConnectMeTextField()
        passwordText.placeholder = "Confirm Password"
        passwordText.attributedPlaceholder = NSAttributedString(string: "Confirm Password", attributes: [NSAttributedStringKey.foregroundColor: ConnectMeConstants.connectMeColours.lightBlueColour])
        passwordText.isSecureTextEntry = true
        return passwordText
    }()
    
    let signupButton : LoginButton = {
        let signup = LoginButton()
        signup.setTitle("Signup", for: .normal)
        signup.buttonTapped()  //figure out how to transition the view controllers
        return signup
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = UIColor(hex: 0x282E82)

        self.view.addSubview(topBanner)
        self.view.addSubview(facebookLogin)
        self.view.addSubview(emailInput)
        self.view.addSubview(passwordInput)
        self.view.addSubview(confirmPasswordInput)
        self.view.addSubview(signupButton)
        
        self.topBannerLayout()
        self.facebookLoginLayout()
        self.emailInputLayout()
        self.setupPasswordLayout()
        self.setupConfirmPasswordLayout()
        self.setupSignupButtonLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func topBannerLayout() {
        let xAxis = topBanner.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        xAxis.isActive = true
        
        let yAxis = NSLayoutConstraint(item: topBanner,
                                       attribute: .top,
                                       relatedBy: .equal,
                                       toItem: self.view,
                                       attribute: .top,
                                       multiplier: 1,
                                       constant: 100)
        yAxis.isActive = true
        
        let leadingAxis = NSLayoutConstraint(item: topBanner,
                                            attribute: .leading,
                                            relatedBy: .equal,
                                            toItem: self.view,
                                            attribute: .leading,
                                            multiplier: 1,
                                            constant: 60)
        leadingAxis.isActive = true
        
        let trailingAxis = NSLayoutConstraint(item: topBanner,
                                            attribute: .trailing,
                                            relatedBy: .equal,
                                            toItem: self.view,
                                            attribute: .trailing,
                                            multiplier: 1,
                                            constant: -60)
        trailingAxis.isActive = true
    }
    
    private func facebookLoginLayout() {
        let facebookYaxis = NSLayoutConstraint(item: facebookLogin,
                                               attribute: .bottom,
                                               relatedBy: .equal,
                                               toItem: topBanner,
                                               attribute: .bottom,
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
    }
    
    private func emailInputLayout() {
    
        let leading = NSLayoutConstraint(item: emailInput,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: self.view,
                                         attribute: .leading,
                                         multiplier: 1,
                                         constant: 40)
        leading.isActive = true
        
        let trailing = NSLayoutConstraint(item: emailInput,
                                         attribute: .trailing,
                                         relatedBy: .equal,
                                         toItem: self.view,
                                         attribute: .trailing,
                                         multiplier: 1,
                                         constant: -80)
        trailing.isActive = true
        
        let yAxis = NSLayoutConstraint(item: emailInput,
                                       attribute: .bottom,
                                       relatedBy: .equal,
                                       toItem: facebookLogin,
                                       attribute: .bottom,
                                       multiplier: 1,
                                       constant: 70)
        yAxis.isActive = true
        emailInput.setBottomBorderSignup()
    }
    
    private func setupPasswordLayout() {
        let leading = NSLayoutConstraint(item: passwordInput,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: self.view,
                                         attribute: .leading,
                                         multiplier: 1,
                                         constant: 40)
        leading.isActive = true
        
        let trailing = NSLayoutConstraint(item: passwordInput,
                                          attribute: .trailing,
                                          relatedBy: .equal,
                                          toItem: self.view,
                                          attribute: .trailing,
                                          multiplier: 1,
                                          constant: -80)
        trailing.isActive = true
        
        let yAxis = NSLayoutConstraint(item: passwordInput,
                                       attribute: .bottom,
                                       relatedBy: .equal,
                                       toItem: emailInput,
                                       attribute: .bottom,
                                       multiplier: 1,
                                       constant: 55)
        yAxis.isActive = true
        passwordInput.setBottomBorderSignup()
    }
    
    private func setupConfirmPasswordLayout() {
        let leading = NSLayoutConstraint(item: confirmPasswordInput,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: self.view,
                                         attribute: .leading,
                                         multiplier: 1,
                                         constant: 40)
        leading.isActive = true
        
        let trailing = NSLayoutConstraint(item: confirmPasswordInput,
                                          attribute: .trailing,
                                          relatedBy: .equal,
                                          toItem: self.view,
                                          attribute: .trailing,
                                          multiplier: 1,
                                          constant: -80)
        trailing.isActive = true
        
        let yAxis = NSLayoutConstraint(item: confirmPasswordInput,
                                       attribute: .bottom,
                                       relatedBy: .equal,
                                       toItem: passwordInput,
                                       attribute: .bottom,
                                       multiplier: 1,
                                       constant: 55)
        yAxis.isActive = true
        confirmPasswordInput.setBottomBorderSignup()
    }
    
    private func setupSignupButtonLayout() {
        let xAxis = signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        xAxis.isActive = true
        
        
        let yAxis = NSLayoutConstraint(item: signupButton,
                                       attribute: .bottom,
                                       relatedBy: .equal,
                                       toItem: confirmPasswordInput,
                                       attribute: .bottom,
                                       multiplier: 1.0,
                                       constant: 100)
        yAxis.isActive = true
    }
    
}
