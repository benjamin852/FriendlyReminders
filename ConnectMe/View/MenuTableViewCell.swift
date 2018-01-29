//
//  MenuTableViewCell.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-01-22.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {


    let textCell : UIButton = {
        let name = UIButton(type: .system)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let setReminderButton : UIButton = {
        let setReminder = UIButton()
        setReminder.translatesAutoresizingMaskIntoConstraints = false
        setReminder.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        setReminder.setTitleColor(.gray, for: .normal)
        setReminder.backgroundColor = ConnectMeConstants.connectMeColours.lightBlueColour
        setReminder.layer.cornerRadius = 20
        setReminder.layer.borderColor = UIColor.clear.cgColor
        return setReminder
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
        addSubview(textCell)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: ("H:|-16-[v0]|"), options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textCell]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: ("V:|[v0]|"), options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textCell]))
        textCell.setTitleColor(ConnectMeConstants.connectMeColours.lightBlueColour, for: .normal)
        
        textCell.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        textCell.addTarget(self, action: #selector(MenuTableViewCell.buttonTapped), for: .touchUpInside)
        
        addSubview(setReminderButton)
    }
    
    @objc func buttonTapped() {
        print ("That guy who shoved in Eilat is a huge pussy")
    }
}


