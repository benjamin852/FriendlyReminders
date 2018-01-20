//
//  LoginButton.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-01-18.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class LoginButton: UIButton {
    var action: (()->())?
    
    func buttonTapped() {
//        self.action = action
        self.addTarget(self, action: #selector(LoginButton.tapped), for: .touchUpInside)
    }
    
    @objc func tapped() {
       print ("tap is received")
        //figure out how to use this to segue to the home VC
    }
    
}
