//
//  DataManager.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 1/22/24.
//

import Foundation
import Foundation
import UIKit
import CoreData


var zikirNowValue = 0
var zikirGoalValue = 0
var prayerNowValue = 0
var prayerGoalValue = 0
var readingNowValue = 0
var readingGoalValue = 0
var allCategory:String?
var seleectLanguage:String?

extension UIViewController{
  
    
    func fetchGoalAndNowValue() {
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateNow = dateFormatter.string(from: currentDate)
        
        dismiss(animated: true, completion: nil)
        
        let coreDataManager = CoreDataManager.shared
        let context = coreDataManager.context
        let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
        
        zikirGoalValue = 0
        zikirNowValue = 0
        prayerGoalValue = 0
        prayerNowValue = 0
        readingGoalValue = 0
        readingNowValue = 0
        
        do {
            let Routines = try context.fetch(fetchRequest)
            
            for routine in Routines {
                guard let goal = routine.goal, let category = routine.category, let today = routine.today, let date = routine.date else { continue }
                allCategory = category
                if let routineGoal = Int(goal), let routineToday = Int(today) {
                    
                    if category == "Zikir" || category == "Dhikr" {
                        zikirGoalValue += routineGoal
                        if date == dateNow {
                            zikirNowValue += routineToday
                        }else {
                            zikirNowValue = 0
                        }
                    } else if category == "Reading" || category == "Okuma" {
                        
                        readingGoalValue += routineGoal
                        if date == dateNow {
                            readingNowValue += routineToday
                        }else {
                            readingNowValue = 0
                        }
                    } else if category == "Prayer" || category == "Namaz" {
                        
                        prayerGoalValue += routineGoal
                        if date == dateNow {
                            prayerNowValue += routineToday
                        }else {
                            prayerNowValue = 0
                        }
                    } else {
                        
                    }
                } else {
                }
            }
            
        } catch {
            
        }
        dataChanged()
    }
    
    
   
}
