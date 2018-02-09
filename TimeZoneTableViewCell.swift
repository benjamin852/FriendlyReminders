//
//  TimeZoneTableViewCell.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-02-08.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class TimeZoneTableViewCell: UITableViewCell {
    
    let timeZoneButton : UIButton = {
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
        addSubview(timeZoneButton)
        timeZoneButton.setTitleColor(ConnectMeConstants.connectMeColours.lightBlueColour, for: .normal)
        timeZoneButton.backgroundColor = ConnectMeConstants.connectMeColours.darkBlueColour
        timeZoneButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    func buttonFunctionality()  {
        timeZoneButton.addTarget(self, action: #selector (ButtonTableViewCell.buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped () {
        print ("wazy")
    }
    
}




