//
//  TimeZoneTableViewCell.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-02-08.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

protocol ClickedDelegate: class {
    func buttonClicked(buttonType:ButtonType)
}


enum ButtonType {
    case time
    case timezone
    case isRepeat
}

class AddNewReminderCellFunctionality: UITableViewCell {  
    
    var field: ModelFieldType!
    weak var delegate:ClickedDelegate?
    var type:ButtonType!
    
    let cellButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.setupButtonViews()
        self.setupTextFieldView()
        self.buttonFunctionality()
        self.backgroundColor = ConnectMeConstants.connectMeColours.lightBlueColour
    }
    
    func setupButtonViews() {
        addSubview(cellButton)
        cellButton.setTitleColor(ConnectMeConstants.connectMeColours.lightBlueColour, for: .normal)
        cellButton.backgroundColor = ConnectMeConstants.connectMeColours.darkBlueColour
        cellButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    func setupTextFieldView()  {
        addSubview(textCell)
        textCell.textColor = ConnectMeConstants.connectMeColours.lightBlueColour
        textCell.backgroundColor = ConnectMeConstants.connectMeColours.darkBlueColour
        textCell.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    func configureWithField(field: ModelFieldType, andValue value: String?, editable: Bool) {
        self.field = field
        
        
        self.cellButton.setTitle(self.field.rawValue, for: .normal)
        
        
        
        self.textCell.text = self.field.rawValue
    }
    
    func buttonFunctionality()  {
        cellButton.addTarget(self, action: #selector (AddNewReminderCellFunctionality.buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped () {
        delegate?.buttonClicked(buttonType: type)
    }


}
