//
//  ViewController.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-01-13.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit
import CoreData

class AddNewCoreDataReminderViewController: UIViewController {

    var moc : NSManagedObjectContext!
    
    @IBOutlet weak var addNewReminderName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    var reminder : Reminder? {
        didSet {
            self.configureView()
        }
    }
    
    func configureView()  {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
       
        if reminder == nil { //if nil then we're creating a brand new reminder
            let newReminder = Reminder(context: moc)
             
            if let unwrappedName = addNewReminderName.text {
                newReminder.name = unwrappedName
            }
            do {
                try moc.save()
            } catch {
                print (error.localizedDescription)
            }
        }
    }
    
    
    @IBAction func button(_ sender: UIButton) {
    }
    
    
}

