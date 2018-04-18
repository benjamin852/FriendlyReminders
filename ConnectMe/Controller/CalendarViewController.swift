//
//  CalendarViewController.swift
//  ConnectMe
//
//  Created by Ben Weinberg on 2018-03-18.
//  Copyright © 2018 Ben Weinberg. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController {

    @IBOutlet weak var calendarView: JTAppleCalendarView!
    
    let outsideMonthColour = UIColor.gray
    let monthColour = UIColor.blue
    let selectedMonthColour = UIColor.white
    let currentDateSelectedColour = UIColor.green
    
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    
    
    @IBOutlet weak var dummyView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    let addNewReminderVC = AddNewReminderVC()
    
    
    let formatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCalendarView()
        self.dummyView.isHidden = true
        self.nameLabel.isHidden = true
        self.timeLabel.isHidden = true
        let background = CAGradientLayer().backgroundColour()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, at: 0)
    }
 
    
    func setupCalendarView() {
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0

        calendarView.visibleDates { (visibleDates) in
            self.setupViewsOfCalendar(from: visibleDates)
        }
    }
 
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        
        self.formatter.dateFormat = "yyyy"
        self.yearLabel.text = self.formatter.string(from: date)
        
        self.formatter.dateFormat = "MMMM"
        self.monthLabel.text = self.formatter.string(from: date)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func handleCellTextColour(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CalendarCell else { return }
        if validCell.isSelected {
            validCell.dateLabel.textColor = selectedMonthColour
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                validCell.dateLabel.textColor = monthColour
            } else {
                validCell.dateLabel.textColor = outsideMonthColour
            }
        }
    }
    
    func colourBackgroundCellSelected(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CalendarCell else { return }
        if validCell.isSelected {
            validCell.selectedView.isHidden = false
        } else {
            validCell.selectedView.isHidden = true
        }
    }
    
    @IBAction func addNewReminder(_ sender: UIBarButtonItem) {
        addNewReminderVC.modalPresentationStyle = .overCurrentContext
        present(addNewReminderVC, animated: true, completion: nil)

    }
}


extension CalendarViewController : JTAppleCalendarViewDelegate {
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        cell.dateLabel.text = cellState.text
        
        colourBackgroundCellSelected(view: cell, cellState: cellState)
        handleCellTextColour(view: cell, cellState: cellState)
        
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        cell.dateLabel.text = cellState.text
        
        colourBackgroundCellSelected(view: cell, cellState: cellState)
        handleCellTextColour(view: cell, cellState: cellState)

        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        colourBackgroundCellSelected(view: cell, cellState: cellState)
        handleCellTextColour(view: cell, cellState: cellState)
        
        
        //we need to check if the user already has a reminder
        self.timeLabel.isHidden = false
        self.nameLabel.isHidden = false
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        colourBackgroundCellSelected(view: cell, cellState: cellState)
        handleCellTextColour(view: cell, cellState: cellState)
        
        self.timeLabel.isHidden = true
        self.nameLabel.isHidden = true 
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupViewsOfCalendar(from: visibleDates)
    }
}

    extension CalendarViewController: JTAppleCalendarViewDataSource {
      
        func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
            formatter.dateFormat = "yyyy MM dd"
            formatter.timeZone = Calendar.current.timeZone
            formatter.locale = Calendar.current.locale
            
            let startDate = formatter.date(from: "2018 01 01")!
            let endDate = formatter.date(from: "2040 12 31")!
            
            let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
            return parameters
        }
        
    }
 



