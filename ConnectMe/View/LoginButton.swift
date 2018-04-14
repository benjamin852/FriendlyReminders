//
//  LoginButton.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-01-18.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class LoginButton: UIButton {
    
    func buttonTapped() {
        self.addTarget(self, action: #selector(LoginButton.tapped), for: .touchUpInside)
    }
    
    @objc func tapped() {
        print ("tap is received")
        //add to notif center
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pushToHomeFromLogin"), object: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        self.setTitleColor(.gray, for: .normal)
        self.backgroundColor = ConnectMeConstants.connectMeColours.lightBlueColour
        self.layer.cornerRadius = 13
        self.layer.borderColor = UIColor.clear.cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
  
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
