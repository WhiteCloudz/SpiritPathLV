//
//  SettingsPOpover.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/25/23.
//

import Foundation
import UIKit
import CoreData

extension HomePage{
    
    
    func openSettingsPopover(){
           dismiss(animated: true, completion: nil)
           let setupIcon = UIImage(systemName: "gearshape")
           let popoverContentController = UIViewController()
           
           let contentView = UIView(frame: CGRect(x: 180, y: 140, width: 280, height: 250))
           setupBackroundImageToVievController(imageNamed: "backround-5" , backroundView: contentView)
           
           let icone = UIButton(type: .system)
           icone.frame = CGRect(x: 15, y: 45, width: 150, height: 30)
           icone.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
           icone.setImage(setupIcon, for: .normal)
           icone.tintColor = UIColor(hex: "201B4D")
           icone.contentHorizontalAlignment = .center
           contentView.addSubview(icone)
           
           let languageButton = UIButton(type: .system)
           languageButton.frame = CGRect(x: 15, y: 100, width: 150, height: 25)
           languageButton.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
           languageButton.tintColor = UIColor(hex: "201B4D")
           languageButton.setTitle(settingsLanguage, for: .normal)
           languageButton.contentHorizontalAlignment = .center
           languageButton.addTarget(self, action: #selector(openLanguageSelectionMenu), for: .touchUpInside)
           contentView.addSubview(languageButton)
           
           let toolTips = UIButton(type: .system)
           toolTips.frame = CGRect(x: 15, y: 140, width: 150, height: 25)
           toolTips.layer.cornerRadius = toolTips.bounds.height / 4
           toolTips.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
           toolTips.tintColor = UIColor(hex: "201B4D")
           toolTips.setTitle(settingsToolTips, for: .normal)
           toolTips.contentHorizontalAlignment = .center
           toolTips.addTarget(self, action: #selector(toolTipsShowed), for: .touchUpInside)
           contentView.addSubview(toolTips)
           
           let ResetButton = UIButton(type: .system)
           ResetButton.frame = CGRect(x: 15, y: 180, width: 150, height: 25)
           ResetButton.backgroundColor = .clear
           ResetButton.tintColor = .red
           ResetButton.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
           ResetButton.contentHorizontalAlignment = .center
           ResetButton.setTitle("Reset", for: .normal)
           ResetButton.addTarget(self, action: #selector(showDeleteAlert), for: .touchUpInside)
           contentView.addSubview(ResetButton)
           
           popoverContentController.view = contentView
           popoverContentController.preferredContentSize = CGSize(width: 180, height: 260)
           popoverContentController.modalPresentationStyle = .popover
           if let popoverPresentationController = popoverContentController.popoverPresentationController {
               popoverPresentationController.permittedArrowDirections = .up
               popoverPresentationController.delegate = self
               popoverPresentationController.sourceView = self.view
               
               let contentWidth = 400
               popoverPresentationController.sourceRect = CGRect(x: 235, y: 35, width: contentWidth, height: 60)
               
               present(popoverContentController, animated: true, completion: nil)
               
           }
           
           isPopoverVisible = true
       }
    
   
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    @objc func showDeleteAlert (){
        dismiss(animated: true, completion: nil)
        let alert = UIAlertController(title: showDeleteAlertTitle, message: showDeleteAlertMessage, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelIptal, style: .default, handler: nil)
        alert.addAction(cancelAction)
        let goAction = UIAlertAction(title: "Reset", style: .default) { [weak self] _ in
            self?.areYouSure ()
        }
        alert.addAction(goAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func areYouSure(){
        dismiss(animated: true, completion: nil)
        let alert = UIAlertController(title: areYouSureTitle, message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelIptal, style: .default, handler: nil)
        alert.addAction(cancelAction)
        let goAction = UIAlertAction(title: yesEvet, style: .default) { [weak self] _ in
            self?.deleteAllData()
            self?.fetchGoalAndNowValue()
            self?.tableView.reloadData()
        }
        alert.addAction(goAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    @objc func openLanguageSelectionMenu() {
        dismiss(animated: true, completion: nil)
        let alert = UIAlertController(title: selectLanguage, message: selectLanguageDescription, preferredStyle: .alert)
            
            for language in LanguageManager.availableLanguages() {
                let action = UIAlertAction(title: language.displayName, style: .default) { [weak self] _ in
                    LanguageManager.saveSelectedLanguage(language: language)
                    self?.viewDidLoad()
                    self?.tableView.reloadData()
                    NotificationCenter.default.post(name: Notification.Name("LanguageDidChangeNotification"), object: nil)
                }
                alert.addAction(action)
            }
            
            self.present(alert, animated: true, completion: nil)
        }
    
    func openLanguageSelectionMenuFirstTime(){
        let languageSelectionFirstTimeKey = "LanguageSelectionFirstTime"
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: languageSelectionFirstTimeKey) {
               return
           } else {
               defaults.set(true, forKey: languageSelectionFirstTimeKey)
               openLanguageSelectionMenu()
           }
    }
    
    @objc func toolTipsShowed() {
        dismiss(animated: true, completion: nil)
        
        let popoverContent = UIViewController()
        popoverContent.modalPresentationStyle = .popover
        popoverContent.preferredContentSize = CGSize(width: 280, height: 610)
        popoverContent.view.backgroundColor = .clear
        setupBackroundImageToVievController(imageNamed: "backround-5" , backroundView: popoverContent.view)
       
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 10, width: 280, height: 610)
        
           scrollView.contentSize = CGSize(width: 260, height: 1725)
           scrollView.contentOffset = CGPoint(x: 0, y: 0)
           popoverContent.view.addSubview(scrollView)
        
        let routineTitle = UILabel()
        routineTitle.frame = CGRect(x: 15, y: 30, width: 120, height: 30)
        routineTitle.backgroundColor = .clear
        routineTitle.textColor = UIColor(hex: "201B4D")
        routineTitle.font = UIFont.systemFont(ofSize: 18)
        routineTitle.isUserInteractionEnabled = false
        routineTitle.text = routineTips
        scrollView.addSubview(routineTitle)
        
        let addNewRoutineLabel = UILabel()
        addNewRoutineLabel.frame = CGRect(x: 15, y: 60, width: 250, height: 30)
        addNewRoutineLabel.backgroundColor = .clear
        addNewRoutineLabel.textColor = UIColor(hex: "201B4D")
        addNewRoutineLabel.font = UIFont.systemFont(ofSize: 17)
        addNewRoutineLabel.isUserInteractionEnabled = false
        addNewRoutineLabel.text = popoverAddDeleteLabel
        scrollView.addSubview(addNewRoutineLabel)
        
        let addRoutineTextView = UITextView()
        addRoutineTextView.frame = CGRect(x: 20, y: 90, width: 240, height: 380)
        addRoutineTextView.textColor = UIColor(hex: "201B4D")
        addRoutineTextView.backgroundColor = .clear
        addRoutineTextView.isEditable = false
        addRoutineTextView.isUserInteractionEnabled = false
        addRoutineTextView.font = UIFont.systemFont(ofSize: 13)
        addRoutineTextView.text = popoverAddDeleteDescription
        scrollView.addSubview(addRoutineTextView)
        
        
        let deleteRoutineLabel = UILabel()
        deleteRoutineLabel.frame = CGRect(x: 15, y: 490, width: 250, height: 30)
        deleteRoutineLabel.backgroundColor = .clear
        deleteRoutineLabel.textColor = UIColor(hex: "201B4D")
        deleteRoutineLabel.isUserInteractionEnabled = false
        deleteRoutineLabel.font = UIFont.systemFont(ofSize: 17)
        deleteRoutineLabel.text = popoverUpdateLabel
        scrollView.addSubview(deleteRoutineLabel)
        
        let deleteRoutineTextView = UITextView()
        deleteRoutineTextView.frame = CGRect(x: 20, y: 520, width: 250, height: 250)
        deleteRoutineTextView.textColor = UIColor(hex: "201B4D")
        deleteRoutineTextView.isUserInteractionEnabled = false
        deleteRoutineTextView.backgroundColor = .clear
        deleteRoutineTextView.isEditable = false
        deleteRoutineTextView.font = UIFont.systemFont(ofSize: 13)
        deleteRoutineTextView.text = popoverUpdateDescription
        scrollView.addSubview(deleteRoutineTextView)
        
        
        let libraryTitle = UILabel()
        libraryTitle.frame = CGRect(x: 15, y: 790, width: 120, height: 30)
        libraryTitle.backgroundColor = .clear
        libraryTitle.textColor = UIColor(hex: "201B4D")
        libraryTitle.font = UIFont.systemFont(ofSize: 18)
        libraryTitle.isUserInteractionEnabled = false
        libraryTitle.text = libraryTips
        scrollView.addSubview(libraryTitle)
        
        let addNewBookLabel = UILabel()
        addNewBookLabel.frame = CGRect(x: 15, y: 820, width: 250, height: 40)
        addNewBookLabel.backgroundColor = .clear
        addNewBookLabel.textColor = UIColor(hex: "201B4D")
        addNewBookLabel.font = UIFont.systemFont(ofSize: 17)
        addNewBookLabel.text = popoverAddDeleteLabelBookStore
        scrollView.addSubview(addNewBookLabel)
        
        let addBookTextView = UITextView()
        addBookTextView.frame = CGRect(x: 20, y: 860, width: 250, height: 100)
        addBookTextView.textColor = UIColor(hex: "201B4D")
        addBookTextView.backgroundColor = .clear
        addBookTextView.isEditable = false
        addBookTextView.font = UIFont.systemFont(ofSize: 13)
        addBookTextView.text = popoverAddDeleteDescriptionBookStore
        scrollView.addSubview(addBookTextView)
        
        
        let deleteBookLabel = UILabel()
        deleteBookLabel.frame = CGRect(x: 15, y: 960, width: 250, height: 40)
        deleteBookLabel.backgroundColor = .clear
        deleteBookLabel.textColor = UIColor(hex: "201B4D")
        deleteBookLabel.font = UIFont.systemFont(ofSize: 17)
        deleteBookLabel.text =  popoverUpdateLabelBookStore
        scrollView.addSubview(deleteBookLabel)
        
        let deleteBookTextView = UITextView()
        deleteBookTextView.frame = CGRect(x: 20, y: 1000, width: 250, height: 175)
        deleteBookTextView.textColor = UIColor(hex: "201B4D")
        deleteBookTextView.backgroundColor = .clear
        deleteBookTextView.isEditable = false
        deleteBookTextView.font = UIFont.systemFont(ofSize: 13)
        deleteBookTextView.text = popoverUpdateDescriptionBookStore
        scrollView.addSubview(deleteBookTextView)
        
        let zikirTitle = UILabel()
        zikirTitle.frame = CGRect(x: 15, y: 1195, width: 120, height: 30)
        zikirTitle.backgroundColor = .clear
        zikirTitle.textColor = UIColor(hex: "201B4D")
        zikirTitle.font = UIFont.systemFont(ofSize: 18)
        zikirTitle.isUserInteractionEnabled = false
        zikirTitle.text = zikirTips
        scrollView.addSubview(zikirTitle)
        
        let addNewZikirLabel = UILabel()
        addNewZikirLabel.frame = CGRect(x: 15, y: 1225, width: 250, height: 40)
        addNewZikirLabel.backgroundColor = .clear
        addNewZikirLabel.textColor =  UIColor(hex: "201B4D")
        addNewZikirLabel.font = UIFont.systemFont(ofSize: 17)
        addNewZikirLabel.text = zikirPopoverAddLabel
        scrollView.addSubview(addNewZikirLabel)
        
        let addZikirTextView = UITextView()
        addZikirTextView.frame = CGRect(x: 20, y: 1265, width: 250, height: 60)
        addZikirTextView.textColor =  UIColor(hex: "201B4D")
        addZikirTextView.backgroundColor = .clear
        addZikirTextView.isEditable = false
        addZikirTextView.font = UIFont.systemFont(ofSize: 13)
        addZikirTextView.text = zikirPopoverAddDescription
        scrollView.addSubview(addZikirTextView)
        
        
        let deleteZikirLabel = UILabel()
        deleteZikirLabel.frame = CGRect(x: 15, y: 1325, width: 250, height: 40)
        deleteZikirLabel.backgroundColor = .clear
        deleteZikirLabel.textColor =  UIColor(hex: "201B4D")
        deleteZikirLabel.font = UIFont.systemFont(ofSize: 17)
        deleteZikirLabel.text = zikirPopoverDeleteLabel
        scrollView.addSubview(deleteZikirLabel)
        
        let deleteZikirTextView = UITextView()
        deleteZikirTextView.frame = CGRect(x: 20, y: 1365, width: 250, height: 175)
        deleteZikirTextView.textColor =  UIColor(hex: "201B4D")
        deleteZikirTextView.backgroundColor = .clear
        deleteZikirTextView.isEditable = false
        deleteZikirTextView.font = UIFont.systemFont(ofSize: 13)
        deleteZikirTextView.text = zikirPopoverDeleteDescription
        scrollView.addSubview(deleteZikirTextView)
        
        let resetCounterLabel = UILabel()
        resetCounterLabel.frame = CGRect(x: 15, y: 1540, width: 250, height: 40)
        resetCounterLabel.backgroundColor = .clear
        resetCounterLabel.textColor =  UIColor(hex: "201B4D")
        resetCounterLabel.font = UIFont.systemFont(ofSize: 17)
        resetCounterLabel.text = zikirResetRoutine
        scrollView.addSubview(resetCounterLabel)
        
        let  resetCounterTextView = UITextView()
        resetCounterTextView.frame = CGRect(x: 20, y: 1580, width: 250, height: 80)
        resetCounterTextView.textColor =  UIColor(hex: "201B4D")
        resetCounterTextView.backgroundColor = .clear
        resetCounterTextView.isEditable = false
        resetCounterTextView.font = UIFont.systemFont(ofSize: 13)
        resetCounterTextView.text = zikirResetDescriptionRoutine
        scrollView.addSubview(resetCounterTextView)
        
           
           let popoverController = popoverContent.popoverPresentationController
           popoverController?.delegate = self
           popoverController?.permittedArrowDirections = []
           
           let screenWidth = UIScreen.main.bounds.width
           let scaledWidth: CGFloat = 280
           let rightMargin: CGFloat = 0
           let topMargin: CGFloat = 100
           
           popoverController?.sourceView = self.view
           popoverController?.sourceRect = CGRect(x: screenWidth - scaledWidth - rightMargin, y: topMargin, width: scaledWidth, height: 0)
           
           present(popoverContent, animated: true, completion: nil)
    }

    
}
