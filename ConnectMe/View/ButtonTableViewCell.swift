//
//  ButtonTableViewCell.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-01-31.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    

    let menuButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
        addSubview(menuButton)
        menuButton.setTitleColor(ConnectMeConstants.connectMeColours.lightBlueColour, for: .normal)
        menuButton.backgroundColor = ConnectMeConstants.connectMeColours.darkBlueColour
        menuButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)

    }
    
    func buttonFunctionality()  {
        menuButton.addTarget(self, action: #selector (ButtonTableViewCell.buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped () {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "timeTapped"), object: nil)
    }
    
    
}
