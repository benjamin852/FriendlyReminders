//
//  MenuTableViewCell.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-01-22.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {


    let calendarButton : UIButton = {
        let calendar = UIButton(type: .system)
        calendar.setTitle("Calendar", for: .normal)
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    let settingsButton : UIButton = {
        let settings = UIButton()
        settings.setTitle("Settings", for: .normal)
        return settings
    }()
    
    
    let supportButton : UIButton = {
        let support = UIButton()
        support.setTitle("Support", for: .normal)
        return support
    }()
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
        self.backgroundColor = ConnectMeConstants.connectMeColours.darkBlueColour
    }
    
    func setupViews()  {
        addSubview(calendarButton)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: ("H:|-16-[v0]|"), options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": calendarButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: ("V:|[v0]|"), options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": calendarButton]))
        calendarButton.setTitleColor(ConnectMeConstants.connectMeColours.lightBlueColour, for: .normal)
        
        calendarButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        calendarButton.addTarget(self, action: #selector(MenuTableViewCell.buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        print ("That guy who shoved in Eilat is a huge pussy")
    }
}


