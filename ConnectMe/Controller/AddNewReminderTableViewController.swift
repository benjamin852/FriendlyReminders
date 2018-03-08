//
//  AddNewReminderViewController.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-01-28.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class AddNewReminderVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()
    
    let newReminder = NewReminder()
    let fields: [ModelFieldType] = [.nameCell, .time, .timeZone, .repeatCell]
    let dateFields: [ModelFieldType] = [.time]
    
    
    var datePickerIndexPath: IndexPath?
    var datePickerVisible: Bool {
        return datePickerIndexPath != nil
    }
    
    let setReminderButton : UIButton = {
        let setReminder = UIButton()
        setReminder.translatesAutoresizingMaskIntoConstraints = false
        setReminder.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)    
        setReminder.setTitleColor(ConnectMeConstants.connectMeColours.lightBlueColour, for: .normal)
        setReminder.backgroundColor = ConnectMeConstants.connectMeColours.darkBlueColour
        setReminder.layer.cornerRadius = 10

        setReminder.layer.borderColor = UIColor.clear.cgColor
        setReminder.setTitle("Set Reminder", for: .normal)
        return setReminder
    }()

    override func viewDidLoad() {
        tableView.register(AddNewReminderCellFunctionality.self, forCellReuseIdentifier: "cell")
        tableView.register(DatePickerTableViewCell.self, forCellReuseIdentifier: "datePickerCell")
       
        tableView.register(ContactNameTableViewCell.self, forCellReuseIdentifier: "contactNameCell")
        
        tableView.frame = CGRect(x: 42, y: 100, width: 310, height: 400) //don't hard code this dumbass
        tableView.backgroundColor = ConnectMeConstants.connectMeColours.lightBlueColour
        tableView.separatorColor = ConnectMeConstants.connectMeColours.darkBlueColour
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.view.addSubview(setReminderButton)
        self.setReminderLayout()
        self.setReminderFunctionality()
        // Dismiss view @BEN this is what I added
///        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeModalVC)))
    }
//    @objc func removeModalVC(){
//        self.dismiss(animated: true, completion: nil) //try call this func with a button and see what happens
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datePickerVisible ? fields.count + 1 :   fields.count //if then else
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86.5; //equal to the harcoded tableView frame up top
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.contentView.backgroundColor = UIColor.clear
        let whiteRoundedView : UIView = UIView(frame: CGRect(x: 0, y: 10, width: self.view.frame.size.width, height: self.view.frame.size.width))
        whiteRoundedView.layer.backgroundColor = UIColor.clear.cgColor
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubview(toBack: whiteRoundedView)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if datePickerVisible && datePickerIndexPath! == indexPath {
           
            let cellPicker = tableView.dequeueReusableCell(withIdentifier: "datePickerCell", for: indexPath) as! DatePickerTableViewCell
            cellPicker.delegate = self as? DatePickerTableViewCellDelegate
            
            // the field will correspond to the index of the row before this one.
            let field = fields[indexPath.row - 1]
            
            cellPicker.configureWithField(field: field, currentDate: newReminder.valueForField(field: field) as? Date)
            return cellPicker
        
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AddNewReminderCellFunctionality
//            let field = calculateFieldForIndexPath(indexPath: indexPath)
//            cell.configureWithField(field: field, andValue: newReminder.stringValueForField(field: field), editable: !dateFields.contains(field))
            
              cell.delegate = self
            
            if indexPath.row == 0 {
                cell.textCell.text = "Name"
            } else if indexPath.row == 1 {
                cell.type = .time

                cell.cellButton.setTitle("Time", for: .normal)
            } else if indexPath.row == 2 {
                cell.type = .timezone

                cell.cellButton.setTitle("Time Zone", for: .normal)
            } else if indexPath.row == 3 {
                cell.type = .isRepeat

                cell.cellButton.setTitle("Repeat", for: .normal)
            }
 
            return cell
        }

    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if !datePickerShouldAppearForRowSelectionAtIndexPath(indexPath: indexPath) {
            dismissDatePickerRow()
            return
        }
        
        self.view.endEditing(true)
        tableView.beginUpdates()
        if datePickerVisible {
            // close datepicker
            tableView.deleteRows(at: [datePickerIndexPath!], with: .fade)

            if datePickerIsRightBelowMe(indexPath: indexPath) {
                // just close the datepicker
                self.datePickerIndexPath = nil
                UIView.animate(withDuration: 0.3, animations: {
                    tableView.frame = CGRect(x: 42, y: 100, width: 310, height: 400)
                    self.view.layoutIfNeeded()
                })

            } else {
                self.datePickerIndexPath = nil
                UIView.animate(withDuration: 0.3, animations: {
                    tableView.frame = CGRect(x: 42, y: 100, width: 310, height: 400)
                    self.view.layoutIfNeeded()
                })
                
            }
        } else {
            self.datePickerIndexPath = IndexPath(row: indexPath.row + 1, section: indexPath.section)
            tableView.insertRows(at: [self.datePickerIndexPath!], with: .fade)
            UIView.animate(withDuration: 0.3, animations: {
                tableView.frame = CGRect(x: 42, y: 100, width: 310, height: 500)
                self.view.layoutIfNeeded()
            })

        }
        tableView.endUpdates()
    }
    
    func calculateFieldForIndexPath(indexPath: IndexPath) -> ModelFieldType {
        if datePickerVisible && datePickerIndexPath!.section == indexPath.section {
            if datePickerIndexPath!.row == indexPath.row { // we are the date picker. Pick the field below me
                return fields[indexPath.row - 1]
            } else if datePickerIndexPath!.row > indexPath.row { // we are "below" the date picker. Just return the field.
                return fields[indexPath.row]
            } else { // we are above the datePicker, so we should substract one from the current row index.
                return fields[indexPath.row - 1]
            }
        } else {
            // The date picker is not showing or not in my section, just return the usual field.
            return fields[indexPath.row]
        }
    }

    func datePickerIsRightAboveMe(indexPath: IndexPath) -> Bool {
        if datePickerVisible && datePickerIndexPath!.section == indexPath.section {
            if indexPath.section != datePickerIndexPath!.section {
                return false
            }
            else {
                return indexPath.row == datePickerIndexPath!.row + 1
            }
        } else {
            return false
        }
    }
    
    func datePickerIsRightBelowMe(indexPath: IndexPath) -> Bool {
        if datePickerVisible && datePickerIndexPath!.section == indexPath.section {
            if indexPath.section != datePickerIndexPath!.section { return false }
            else {
                return indexPath.row == datePickerIndexPath!.row - 1
            }
        } else {
            return false
        }
    }
    
    func dismissDatePickerRow() {
        if !datePickerVisible {
            return
        }
        tableView.beginUpdates()
        tableView.deleteRows(at: [datePickerIndexPath!], with: .fade)
        datePickerIndexPath = nil
        tableView.endUpdates()
    }
    
    func datePickerShouldAppearForRowSelectionAtIndexPath(indexPath: IndexPath) -> Bool {
        let field = calculateFieldForIndexPath(indexPath: indexPath)
        return dateFields.contains(field)
    }
    
    
    func dateChangedForField(field: ModelFieldType, toDate date: Date) {
        print("Date changed for field \(field) to \(date)")
        newReminder.setValue(value: date, forField: field)
        tableView.reloadData()
    }
    
    
    func field(field: ModelFieldType, changedValueTo value: String) {
        print("Value changed for field \(field) to \(value)")
        newReminder.setValue(value: value, forField: field)
        tableView.reloadData() //causes the one letter at a time issue
    }
    
    func fieldDidBeginEditing(field: ModelFieldType) {
        dismissDatePickerRow()
    }
    
 
    private func setReminderLayout () {
        let xAxis = setReminderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        xAxis.isActive = true
        let yAxis = NSLayoutConstraint(item: setReminderButton,
                                       attribute: .bottom,
                                       relatedBy: .equal,
                                       toItem: tableView,
                                       attribute: .bottom,
                                       multiplier: 1.0,
                                       constant: 0)
        yAxis.isActive = true
    }
    
    func setReminderFunctionality() {
        setReminderButton.addTarget(self, action: #selector(addReminderFunctionality), for: .touchUpInside)
    }
    @objc func addReminderFunctionality () {
        self.dismiss(animated: true, completion: nil)
    }
}

extension AddNewReminderVC:ClickedDelegate {

    func textFieldClicked(textField: UITextField) {

    }
    
    func buttonClicked(buttonType:ButtonType) {
        switch buttonType {
        case .time:
            //  NotificationCenter.default.post(name: NSNotification.Name(rawValue: "timeTapped"), object: nil)
            print ("Time Tapped")
        case .timezone:
            print("Timezone")
        case .isRepeat:
            print("IsRepeat")
            //            if menuButton.backgroundColor == ConnectMeConstants.connectMeColours.darkBlueColour {
            //                menuButton.backgroundColor = UIColor.green
            //            } else {
            //                menuButton.backgroundColor = ConnectMeConstants.connectMeColours.darkBlueColour
            //            }
        }
        
        

    }
}

