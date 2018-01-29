//
//  AllRemindersTableViewController.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-01-14.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit
import CoreData

class AllRemindersTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var moc : NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    var fetchedResultsController: NSFetchedResultsController<Reminder> {
        
        //check if FRC already exists
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let request : NSFetchRequest<Reminder> = Reminder.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        let newFetchedResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: self.moc, sectionNameKeyPath: nil, cacheName: nil)
        newFetchedResultController.delegate = self
        _fetchedResultsController = newFetchedResultController
        
        
        do {
            try _fetchedResultsController?.performFetch()
        } catch {
            print (error.localizedDescription)
        }
        return _fetchedResultsController!
    }
  
    var _fetchedResultsController: NSFetchedResultsController<Reminder>? = nil
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0  //if no sections return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell", for: indexPath)
        let reminderCell = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = reminderCell.name
        return cell
     }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
