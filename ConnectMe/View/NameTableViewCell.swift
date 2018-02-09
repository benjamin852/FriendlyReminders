//
//  MenuTableViewCell.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-01-22.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    
    
    let textCell : UITextField = {
        let name = UITextField()
        name.isUserInteractionEnabled = true
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupTextFieldViews()
        self.backgroundColor = ConnectMeConstants.connectMeColours.lightBlueColour
    }
    
    
    func setupTextFieldViews()  {
        addSubview(textCell)
        textCell.textColor = ConnectMeConstants.connectMeColours.lightBlueColour
        textCell.backgroundColor = ConnectMeConstants.connectMeColours.darkBlueColour
        textCell.font = UIFont.boldSystemFont(ofSize: 30)
    }
    //        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: ("H:|-16-[v0]|"), options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textCell]))
    //        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: ("V:|[v0]|"), options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textCell]))
    
}


