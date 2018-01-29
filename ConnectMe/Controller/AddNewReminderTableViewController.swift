//
//  AddNewReminderViewController.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-01-28.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class AddNewReminderVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let sections = ["Menu Items", "Set Reminder"]
    
    var buttons = [UIButton]()
    
    let menuItems = [["Name", "Date", "Time Zone", "Repeat"], ["Set Reminder"]]
    
    
    
    
    override func viewDidLoad() {
        let tableView = UITableView()
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.frame = CGRect(x: 45, y: 90, width: 285, height: 385) //don't hard code this dumbass
        
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems[section].count //counts the rows of index of specific section
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! MenuTableViewCell
        cell.textCell.setTitle(menuItems[indexPath.section][indexPath.row], for: .normal)
        cell.setReminderButton.setTitle("Set Reminder", for: .normal)
        return cell
    }
}

