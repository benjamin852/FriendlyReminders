//
//  ConnectMeBarButton.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-01-24.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class ConnectMeBarButton: UIBarButtonItem {
    
    override init() {
        super.init()
        self.tintColor = ConnectMeConstants.connectMeColours.lightBlueColour
        setTitleTextAttributes([ NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 26)], for: UIControlState.normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
