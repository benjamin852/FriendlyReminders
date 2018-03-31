//
//  Extensions.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-01-19.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = ConnectMeConstants.connectMeColours.temporaryFixUsername.cgColor  //go over a better alternative with mike [this makes border around textField appear invisible. But does not remove it]
        self.layer.masksToBounds = false
        self.layer.shadowColor = ConnectMeConstants.connectMeColours.lightBlueColour.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    func setBottomBorderPas() {
        self.borderStyle = .none
        self.layer.backgroundColor = ConnectMeConstants.connectMeColours.temporaryFixPassword.cgColor  //go over a better alternative with mike [this makes border around textField appear invisible. But does not remove it]
        self.layer.masksToBounds = false
        self.layer.shadowColor = ConnectMeConstants.connectMeColours.lightBlueColour.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
   
}

extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}

extension UILabel {
    func setBottomBorder() {
        self.layer.backgroundColor = ConnectMeConstants.connectMeColours.temporaryFixHomepageLabel.cgColor  //go over a better alternative with mike [this makes border around textField appear invisible. But does not remove it]
        self.layer.masksToBounds = false
        self.layer.shadowColor = ConnectMeConstants.connectMeColours.lightBlueColour.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

extension CAGradientLayer {
    func backgroundColour() -> CAGradientLayer {
        let topColour = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
        let bottomColour = UIColor(red: 0/255.0, green: 0/255.0, blue: 102/255.0, alpha: 1)

        
        
        let gradientColours : [CGColor] = [topColour.cgColor, bottomColour.cgColor]
        let gradientLocations : [Float] = [0.0, 1.0]
        
        let gradientLayer : CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColours
        gradientLayer.locations = gradientLocations as [NSNumber]
        
        return gradientLayer
        
    }
}


