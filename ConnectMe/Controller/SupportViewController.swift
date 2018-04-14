//
//  SupportViewController.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-04-08.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class SupportViewController: UIViewController {

    let supportLabel : UILabel = {
        let supportL = UILabel()
        supportL.text  = "Support"
        supportL.font = UIFont.boldSystemFont(ofSize: 40)
        supportL.translatesAutoresizingMaskIntoConstraints = false
        supportL.textColor = ConnectMeConstants.connectMeColours.lightBlueColour
        return supportL
    }()
    
    let assistanceText : UILabel = {
        let assistance = UILabel()
        assistance.text = "For all suggestions, concerns, and questions please reach out to our help staff."
        assistance.translatesAutoresizingMaskIntoConstraints = false
        assistance.font = UIFont.boldSystemFont(ofSize: 28)
        assistance.adjustsFontSizeToFitWidth = true
        assistance.numberOfLines = 3
        assistance.textColor = ConnectMeConstants.connectMeColours.lightBlueColour
        return assistance
    }()
    
    
    let emailButton : LoginButton = {
        let emailUs = LoginButton()
        emailUs.setTitle("Email Us!", for: .normal)
        emailUs.translatesAutoresizingMaskIntoConstraints = false
        emailUs.buttonTapped()
        return emailUs
    }()
    
    let friendsPic : UIImageView = {
        let pic = UIImageView(image: #imageLiteral(resourceName: "pussies"))
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.adjustsImageSizeForAccessibilityContentSizeCategory = true
        return pic
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = UIColor(hex: 0x383F9C)
        
        self.view.addSubview(supportLabel)
        self.view.addSubview(emailButton)
        self.view.addSubview(assistanceText)
        self.view.addSubview(friendsPic)
        self.setupSupportLabel()
        self.setupEmailUs()
        self.setupAssistanceText()
        self.setupFriendsPic()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupSupportLabel() {
        let xAxis = supportLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        xAxis.isActive = true
        
        let yAxis = NSLayoutConstraint(item: supportLabel,
                                       attribute: .top,
                                       relatedBy: .equal,
                                       toItem: assistanceText,
                                       attribute: .top,
                                       multiplier: 1,
                                       constant: -70)
        yAxis.isActive = true
    }
    
    
    private func setupAssistanceText() {
        let xAxis = assistanceText.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        xAxis.isActive = true
        
        let yAxis = NSLayoutConstraint(item: assistanceText,
                                       attribute: .bottom,
                                       relatedBy: .equal,
                                       toItem: emailButton,
                                       attribute: .bottom,
                                       multiplier: 1,
                                       constant: -85)
        yAxis.isActive = true
        let textTrailing = NSLayoutConstraint(item: assistanceText,
                                               attribute: .trailing,
                                               relatedBy: .equal,
                                               toItem: self.view,
                                               attribute: .trailing,
                                               multiplier: 1,
                                               constant: -30)
        textTrailing.isActive = true
        
        let textLeading = NSLayoutConstraint(item: assistanceText,
                                              attribute: .leading,
                                              relatedBy: .equal,
                                              toItem: self.view,
                                              attribute: .leading,
                                              multiplier: 1,
                                              constant: 30)
        textLeading.isActive = true
        
    }
    
    private func setupEmailUs() {
        let xAxis = emailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        xAxis.isActive = true
        
        let yAxis = emailButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        yAxis.isActive = true
    }
    
    private func setupFriendsPic() {
        let xAxis = friendsPic.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        xAxis.isActive = true
        
        let yAxis = NSLayoutConstraint(item: friendsPic,
                                      attribute: .bottom,
                                      relatedBy: .equal,
                                      toItem: self.view,
                                      attribute: .bottom,
                                      multiplier: 1.0,
                                      constant: -30)
        yAxis.isActive = true
    }
}






























