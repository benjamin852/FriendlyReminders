//
//  DatePickerTableViewCell.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-02-17.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

protocol DatePickerTableViewCellDelegate: class {
    func dateChangedForField(field: ModelFieldType, toDate date: Date)
}

class DatePickerTableViewCell: UITableViewCell {

    
    let datePicker = UIDatePicker()
    var field: ModelFieldType!
    weak var delegate: DatePickerTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(datePicker)
        self.backgroundColor = ConnectMeConstants.connectMeColours.darkBlueColour
        self.datePicker.addTarget(self, action: #selector (valueChanged), for: .valueChanged)
    }
    
    func configureWithField(field: ModelFieldType, currentDate: Date?) {
        self.field = field
        self.datePicker.date = currentDate ?? Date()
    }
    
    @objc func valueChanged(_ sender: Any)  {
        self.delegate?.dateChangedForField(field: field, toDate: datePicker.date)
    }
    
   

  
    
}
