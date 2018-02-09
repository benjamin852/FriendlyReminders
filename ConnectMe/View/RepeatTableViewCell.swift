//
//  RepeatTableViewCell.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-02-08.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class RepeatTableViewCell: UITableViewCell {

    
    
    let reminderButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupButtonViews()
        self.buttonFunctionality()
        self.backgroundColor = ConnectMeConstants.connectMeColours.lightBlueColour
    }
 
    func setupButtonViews() {
        addSubview(reminderButton)
        reminderButton.setTitleColor(ConnectMeConstants.connectMeColours.lightBlueColour, for: .normal)
        reminderButton.backgroundColor = ConnectMeConstants.connectMeColours.darkBlueColour
        reminderButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    func buttonFunctionality()  {
        reminderButton.addTarget(self, action: #selector (ButtonTableViewCell.buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped () {
        print ("wazy")
    }
}


//    @objc func changeReminderBackground()  {
//        if menuButton.backgroundColor == ConnectMeConstants.connectMeColours.darkBlueColour {
//            menuButton.backgroundColor = UIColor.green
//        } else {
//            menuButton.backgroundColor = ConnectMeConstants.connectMeColours.darkBlueColour
//        }
//    }
