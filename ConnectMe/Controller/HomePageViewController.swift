//
//  HomePageViewController.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-01-18.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    
    let friendlyReminders : UILabel = {
       let friendlyRemindersLabel = UILabel()
        friendlyRemindersLabel.text = "FRIENDLY REMINDERS"
        friendlyRemindersLabel.font = UIFont.italicSystemFont(ofSize: 30)
        friendlyRemindersLabel.translatesAutoresizingMaskIntoConstraints = false
        friendlyRemindersLabel.textColor = ConnectMeConstants.connectMeColours.lightBlueColour
        return friendlyRemindersLabel   
    }()
    
    let quoteTextLabel : UILabel = {
        let quoteText = UILabel()
        quoteText.text = "\"There are tall ships and small ships and ships that sail the sea, but the best ships are friendships and forever they shall be!\""
        quoteText.translatesAutoresizingMaskIntoConstraints = false
        quoteText.font = UIFont.boldSystemFont(ofSize: 28)
        quoteText.numberOfLines = 5
        quoteText.textColor = ConnectMeConstants.connectMeColours.lightBlueColour
        return quoteText
    }()
    
    let friendsImage : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "pussies"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.adjustsImageSizeForAccessibilityContentSizeCategory = true
        return image
    }()
    
    let addReminder : UIBarButtonItem = {
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewReminder))

        add.width = 20
        return add
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(quoteTextLabel)
        view.addSubview(friendlyReminders)
        view.addSubview(friendsImage)
        self.setupLabels()
        self.setupImageLayout()
        self.view.backgroundColor = UIColor.gray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor.gray
        self.navigationItem.leftBarButtonItem = addReminder
    }
    
    
    @objc func addNewReminder()  {
        //finish up later
    }
    
    
    private func setupLabels() {
        quoteTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        quoteTextLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        let quoteTrailing = NSLayoutConstraint(item: quoteTextLabel,
                                              attribute: .trailing,
                                              relatedBy: .equal,
                                              toItem: self.view,
                                              attribute: .trailing,
                                              multiplier: 1,
                                              constant: -40)
        quoteTrailing.isActive = true
        
        let quoteLeading = NSLayoutConstraint(item: quoteTextLabel,
                                               attribute: .leading,
                                               relatedBy: .equal,
                                               toItem: self.view,
                                               attribute: .leading,
                                               multiplier: 1,
                                               constant: 40)
        quoteLeading.isActive = true
       
        
        
        friendlyReminders.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        friendlyReminders.setBottomBorder()
        let reminderLabelTrailing = NSLayoutConstraint(item: friendlyReminders,
                                                      attribute: .trailing,
                                                      relatedBy: .equal,
                                                      toItem: self.view,
                                                      attribute: .trailing,
                                                      multiplier: 1,
                                                      constant: -60)
        reminderLabelTrailing.isActive = true
       
        let reminderLabelLeading = NSLayoutConstraint(item: friendlyReminders,
                                                       attribute: .leading,
                                                       relatedBy: .equal,
                                                       toItem: self.view,
                                                       attribute: .leading,
                                                       multiplier: 1,
                                                       constant: 40)
        reminderLabelLeading.isActive = true
        
        let reminderLabelYaxis = NSLayoutConstraint(item: friendlyReminders,
                                                    attribute: .top,
                                                    relatedBy: .equal,
                                                    toItem: quoteTextLabel,
                                                    attribute: .top,
                                                    multiplier: 1,
                                                    constant: -60)
        reminderLabelYaxis.isActive = true
        
    }
    
    private func setupImageLayout() {
        friendsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        let imageYaxis = NSLayoutConstraint(item: friendsImage,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: quoteTextLabel,
                                            attribute: .top,
                                            multiplier: 1,
                                            constant: 170)
        imageYaxis.isActive = true
    }
}
