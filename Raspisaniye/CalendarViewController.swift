//
//  CalendarViewController.swift
//  Raspisaniye
//
//  Created by Анна Товстыга on 17/10/16.
//  Copyright © 2016 rGradeStd. All rights reserved.
//

import UIKit
import CVCalendar
import RealmSwift

import SwiftDate


class CalendarViewController: UIViewController,CVCalendarViewDelegate, CVCalendarMenuViewDelegate{
    enum `Type`: Int {
        case month = 1
        case week = 2
    }
    var selectedDate = DateInRegion()
   
    
    
    @IBOutlet weak var labelMonth: UILabel!
    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var menuView: CVCalendarMenuView!
    
    
//    
//    let realm = try! Realm()
//   
//    var realmDay:Day = Day()
    
//      var selectedDay:DayView!
    
    func presentationMode() -> CalendarMode {
        
        return CalendarMode.monthView
    }
    
    
    /// Required method to implement!
    func firstWeekday() -> Weekday {
        return Weekday.monday
    }
    var presentedDate:Date!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if(selectedDate.weekday == 1) //To identify monday correctly
//        {
//            selectedDate = selectedDate + 1.days
//        }
//        if(selectedDate.weekday > 2)
//        {
//            let weekday = selectedDate.weekday
//            let toMinus = weekday - 2
//            selectedDate = selectedDate - toMinus.days
//        }
//        if(selectedDate.weekday > 3){
//            let weekday = selectedDate.weekday
//            let toMinus = weekday - 3
//            selectedDate = selectedDate - toMinus.days
//        }
//        if (selectedDate.weekday < 3){
//            let weekday = selectedDate.weekday
//            let toPlus = 3 - weekday
//            selectedDate = selectedDate + toPlus.days
//        }
//        if(selectedDate.weekday > 4)
//        {
//            let weekday = selectedDate.weekday
//            let toMinus = weekday - 4
//            selectedDate = selectedDate - toMinus.days
//            print(selectedDate)
//        }
//        if (selectedDate.weekday < 4) {
//            let weekday = selectedDate.weekday
//            let toPlus = 4 - weekday
//            selectedDate = selectedDate + toPlus.days
//            print(selectedDate)
//        }
//        if(selectedDate.weekday > 5)
//        {
//            let weekday = selectedDate.weekday
//            let toMinus = weekday - 5
//            selectedDate = selectedDate - toMinus.days
//            print(selectedDate)
//        }
//        if (selectedDate.weekday < 5) {
//            let weekday = selectedDate.weekday
//            let toPlus = 5 - weekday
//            selectedDate = selectedDate + toPlus.days
//            print(selectedDate)
//        }
//        if(selectedDate.weekday > 6)
//        {
//            let weekday = selectedDate.weekday
//            let toMinus = weekday - 6
//            selectedDate = selectedDate - toMinus.days
//            print(selectedDate)
//        }
//        if (selectedDate.weekday < 6) {
//            let weekday = selectedDate.weekday
//            let toPlus = 6 - weekday
//            selectedDate = selectedDate + toPlus.days
//            print("that's friday biitch\(selectedDate)")
//        }
//        if(selectedDate.weekday > 7)
//        {
//            let weekday = selectedDate.weekday
//            let toMinus = weekday - 7
//            selectedDate = selectedDate - toMinus.days
//            print(selectedDate)
//        }
//        if (selectedDate.weekday < 7) {
//            let weekday = selectedDate.weekday
//            let toPlus = 7 - weekday
//            selectedDate = selectedDate + toPlus.days
//            print(selectedDate)
//        }
        // CVCalendarMenuView initialization with frame
//        self.menuView = CVCalendarMenuView(frame: CGRectMake(0, 0, 300, 15))
//        
//        // CVCalendarView initialization with frame
//        self.calendarView = CVCalendarView(frame: CGRectMake(0, 20, 300, 450))
        labelMonth.text = CVDate(date: Date()).globalDescription
//        labelMonth.text = String(month)
        
       
        calendarView.calendarAppearanceDelegate = self
        calendarView.animatorDelegate = self
        menuView.menuViewDelegate = self
        calendarView.calendarDelegate = self
        

    
    }
   
    
    /// Required method to implement!


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        menuView.commitMenuViewUpdate()
        calendarView.commitCalendarViewUpdate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

    func didSelectDayView(_ dayView: DayView, animationDidFinish: Bool) {
//    presentedDate = dayView.date
//    var selectedDate = calendarView.presentedDate.commonDescription
//    print("aand selected Date is \(calendarView.presentedDate.commonDescription)")
//    
    
    
//        sideMenuVC.mainViewController?.childViewControllers.first?.performSegueWithIdentifier("weekSegue", sender: nil)


//guard
//        var  nextController  = storyboard?.instantiateViewControllerWithIdentifier("mainTabBar") as! MMSwiftTabBarController
//        let navigationController = self.navigationController
//        else {
//            return
//        }
//        nextController.selectedDate = DateInRegion()
//        navigationController.pushViewController(nextController, animated: true)
        
//            print(sideMenuVC.mainViewController?.childViewControllers.first)
        let regionRome = Region.Local()
//        Region(calendarName: .Current , timeZoneName: TimeZoneName.europeMoscow, localeName: LocaleName.russian)
        let dateInReg = DateInRegion(absoluteDate: dayView.date.convertedDate()!)
        self.selectedDate = dateInReg
        let dsVC = sideMenuVC.mainViewController?.childViewControllers.first as! MMSwiftTabBarController
        dsVC.selectedDate = self.selectedDate
        dsVC.updateRealmDay()
    }
//      override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue == "trySegue " {
//            
//        let vc = segue.destinationViewController as! MMSwiftTabBarController
//        vc.selectedDate = self.selectedDate
//        print("god pleeaaseee\(selectedDate)")
//        }
//         }
//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "" {
//            if let VC = segue.destinationViewController as? MMSwiftTabBarController {
//                VC.selectedDate
//            }
//        }
//        }
}

