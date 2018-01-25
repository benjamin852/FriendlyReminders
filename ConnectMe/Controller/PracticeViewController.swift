//
//  PracticeViewController.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-01-23.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit


class PracticeViewController: UITableViewController {

    
    
    var menuItems = ["Calendar", "Settings", "Support"]
    
    override func viewDidLoad() {
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "cellID")
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! MenuTableViewCell
        cell.calendarButton.setTitle(menuItems[indexPath.row], for: .normal)
        return cell
    }
}


