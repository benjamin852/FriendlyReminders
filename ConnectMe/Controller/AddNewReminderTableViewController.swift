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
        tableView.register(CreateNotificationTableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.register(ContactNameTableViewCell.self, forCellReuseIdentifier: "cellName")
//        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: "cellButton")
//        tableView.register(TimeZoneTableViewCell.self, forCellReuseIdentifier: "cellTimeZone")
//        tableView.register(RepeatTableViewCell.self, forCellReuseIdentifier: "cellRepeat")
        tableView.frame = CGRect(x: 42, y: 100, width: 310, height: 400) //don't hard code this dumbass
        tableView.backgroundColor = ConnectMeConstants.connectMeColours.lightBlueColour
        tableView.separatorColor = ConnectMeConstants.connectMeColours.darkBlueColour
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.view.addSubview(setReminderButton)
        self.setReminderLayout()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CreateNotificationTableViewCell

        if indexPath.row == 0 {
            cell.type = .name
//            cell.textCell.text =  "Name"
        } else if indexPath.row == 1 {  //else if indexPath.row > 0 {
            cell.type = .time
//            cell.menuButton.setTitle("Time", for: .normal)
        } else if indexPath.row == 2 {
            cell.type = .timezone
//            cell.timeZoneButton.setTitle("Time Zone", for: .normal)
         }else if indexPath.row == 3 {
            cell.type = .isRepeat
//            cell.reminderButton.setTitle("Repeat", for: .normal)
        }

        cell.delegate = self
        
        return cell
    }
    
    
    
    private func setReminderLayout () {
        let xAxis = setReminderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        xAxis.isActive = true
        let yAxis = NSLayoutConstraint(item: setReminderButton,
                                       attribute: .bottom,
                                       relatedBy: .equal,
                                       toItem: self.tableView,
                                       attribute: .bottom,
                                       multiplier: 1.0,
                                       constant: 0)
        yAxis.isActive = true
    }
}

extension AddNewReminderVC:ClickedDelegate {
    func buttonClicked(buttonType:ButtonType) {
        switch buttonType {
        case .name:
            print("Name")
        case .time:
            print("Time")
        case .timezone:
            print("Timezone")
        case .isRepeat:
            print("IsRepeat")
        }
    }
}
