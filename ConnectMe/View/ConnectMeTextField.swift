
//
//  ConnectMeTextField.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-04-10.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class ConnectMeTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont.boldSystemFont(ofSize: 25)
        self.textAlignment = .left
        self.textColor = ConnectMeConstants.connectMeColours.lightBlueColour
        self.translatesAutoresizingMaskIntoConstraints = false
        //        usernameText.isUserInteractionEnabled = true          <-- not working?
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
