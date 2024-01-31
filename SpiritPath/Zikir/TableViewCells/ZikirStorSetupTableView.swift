//
//  ZikirViewCounterSetupTableView.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/2/23.
//

import UIKit
import CoreData

extension ZikirViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                return counterData.count
            case 1:
                return asmaListEnglish.count
            default:
                return 0
            }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ZikirViewCell", for: indexPath) as! ZikirViewCell
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let Zikir = storyBoard.instantiateViewController(withIdentifier: "ZikirCounter") as! ZikirCounter
        var currentData: ZikirData?
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            currentData = counterData[indexPath.row]
            currentData?.ZikirControl = "counter"
        case 1:
            let selectedLanguage = LanguageManager.getSelectedLanguage()
            if selectedLanguage == .english {
            currentData = asmaListEnglish[indexPath.row]
            currentData?.ZikirControl = "controlAsma"
            }else if selectedLanguage == .turkish {
            currentData = asmaListTurkish[indexPath.row]
            currentData?.ZikirControl = "controlAsma"
            }
        default:
            break
        }
        
        if let data = currentData {
            cell.ConfigureCell(data) {
                self.navigationController?.pushViewController(Zikir, animated: true)
                Zikir.zikirName = data.ZikirName
                Zikir.zikirControl = data.ZikirControl
                Zikir.zikirRecomended = data.ZikirRecomend
            }
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if segmentedControl.selectedSegmentIndex == 0 {
            if editingStyle == .delete {
                let zikirToDelete = counterData[indexPath.row]
                let zikirName = zikirToDelete.ZikirName
                
                let coreDataManager = CoreDataManager.shared
                let context = coreDataManager.context
                
                let fetchRequestRoutine = NSFetchRequest<RoutineData>(entityName: "RoutineData")
                fetchRequestRoutine.predicate = NSPredicate(format: "name == %@", zikirName)
                
                let alert = UIAlertController(title: deleteZikirLabel, message: deleteZikirDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: yesEvet, style: .default) {  _ in
                    do {
                        let resultsZikir = try context.fetch(fetchRequestRoutine)
                        if let zikirRouting = resultsZikir.first {
                            context.delete(zikirRouting)
                            try context.save()
                            self.dataChanged()
                            self.counterData.remove(at: indexPath.row)
                            tableView.deleteRows(at: [indexPath], with: .fade)
                        } else {
                            print("Zikir Not Fount")
                        }
                    } catch {
                        self.showAlert(title: alertTitleErrorZikir, message: willDeletingZikirDescription)
                    }
                })
                alert.addAction(UIAlertAction(title: zikirCancel, style: .default))
                present(alert, animated: true, completion: nil)
            }
        } else {
            showAlert(title: alertTitleErrorZikir, message: canNotDeleted)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      130
        
        }
    
    func ToolTipMessage(){
        let isPopupShown = UserDefaults.standard.bool(forKey: "popupShown")
        if !isPopupShown {
            let alert = UIAlertController(title: "Tooltip", message: toolTipMessageDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: okZikir, style: .default))
            present(alert, animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "popupShown")
        }
    }
}
