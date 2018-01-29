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
        friendlyRemindersLabel.adjustsFontSizeToFitWidth = true
        friendlyRemindersLabel.translatesAutoresizingMaskIntoConstraints = false
        friendlyRemindersLabel.textColor = ConnectMeConstants.connectMeColours.lightBlueColour
        return friendlyRemindersLabel   
    }()
    
    let quoteTextLabel : UILabel = {
        let quoteText = UILabel()
        quoteText.text = "\"There are tall ships and small ships and ships that sail the sea, but the best ships are friendships and forever they shall be!\""
        quoteText.translatesAutoresizingMaskIntoConstraints = false
        quoteText.font = UIFont.boldSystemFont(ofSize: 28)
        quoteText.adjustsFontSizeToFitWidth = true
        quoteText.numberOfLines = 5
        quoteText.textColor = ConnectMeConstants.connectMeColours.lightBlueColour
        return quoteText
    }()
    
    let friendsImage : UIImageView = {
        let friendsPic = UIImageView(image: #imageLiteral(resourceName: "pussies"))
        friendsPic.translatesAutoresizingMaskIntoConstraints = false
        friendsPic.adjustsImageSizeForAccessibilityContentSizeCategory = true
        return friendsPic
    }()
    
    
    lazy var addReminder : UIBarButtonItem = {
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(HomePageViewController.addNewReminderr))

        return add
    }()
    
    @objc func addNewReminderr()  {
        print ("PATS FOR SUPERBOWL")
        let modalViewController = AddNewReminderVC()
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
    
    }
  
    
    lazy var calendarButton : ConnectMeBarButton = {
        let calendar = ConnectMeBarButton.init(title: "Calendar", style: UIBarButtonItemStyle.plain, target: self, action: #selector(buttonTapped))
        return calendar
    }()
    
    lazy var settingsButton : ConnectMeBarButton = {
        let settings = ConnectMeBarButton.init(title: "Settings", style: UIBarButtonItemStyle.plain, target: self, action: #selector(buttonTapped))
        return settings
    }()
    
    
    lazy var supportButton : ConnectMeBarButton = {
        let support = ConnectMeBarButton.init(title: "Support", style: UIBarButtonItemStyle.plain, target: self, action: #selector(buttonTapped))
        return support
    }()
    
    @objc func buttonTapped() {
        print ("That guy who shoved me in Eilat is a huge pussy")
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(quoteTextLabel)
        view.addSubview(friendlyReminders)
        view.addSubview(friendsImage)
        self.setupLabels()
        self.setupImageLayout()
        
        let background = CAGradientLayer().backgroundColour()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.leftBarButtonItems = [addReminder, calendarButton, settingsButton, supportButton]
        self.navigationController?.navigationBar.barTintColor = ConnectMeConstants.connectMeColours.whiteColor
        
        let height : CGFloat = 30
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)

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
