//
//  RoutinePage.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/5/23.
//

import UIKit
import CoreData

class RoutinePage: UIViewController, UIPopoverPresentationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .portrait
       }

       override var shouldAutorotate: Bool {
           return false
       }
    
    @IBOutlet var backroundView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var nameOfRoutine: String?
    var goalOfRoutine: String?
    var categoryOfRoutine: String?
    var nameTextFiel: UITextField?
    var goalTextFiel: UITextField?
    var pickerView: UIPickerView?
    var updateRoutineGoalName:String?
    let numbers = Array(0...10000)
    var dataSource = [Routine]()
    let selectButton = UIButton()
    var categoryOptions: [String] = []
    var popoverContent: UIViewController?
    var isPopoverVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackroundImageToVievController(imageNamed: "backround-5" , backroundView: backroundView)
        ToolTipMessage()
        setupTableView()
        fetchCounterDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCounterDataSource()
    }
    
    func setupTableView(){
        tableView.register(UINib(nibName: "RoutineTableViewCell", bundle: nil), forCellReuseIdentifier: "RoutineTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
  
    
    
    @IBAction func AddNewRoutine(_ sender: Any) {
        updatePickerForSelectedLanguage()
        openAddRoutinePopup()
    }
    
    func openAddRoutinePopup() {
        dismiss(animated: true, completion: nil)
        
        let popupContentController = UIViewController()
        
        let contentView = UIView()
        setupBackroundImageToVievController(imageNamed: "backround-5" , backroundView: contentView)
        
        nameTextFiel = UITextField()
        nameTextFiel?.frame = CGRect(x: 15, y: 50, width: 240, height: 40)
        nameTextFiel?.borderStyle = .roundedRect
        nameTextFiel?.textAlignment = .center
        nameTextFiel?.attributedPlaceholder = NSAttributedString(string: popoverroutineName, attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "919191")])
        nameTextFiel?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        nameTextFiel?.textColor = UIColor(hex: "201B4D")
        nameTextFiel?.layer.cornerRadius = (nameTextFiel?.bounds.height ?? 0) / 8
        contentView.addSubview(nameTextFiel!)
        
        goalTextFiel = UITextField()
        goalTextFiel?.frame = CGRect(x: 15, y: 110, width: 240, height: 40)
        goalTextFiel?.borderStyle = .roundedRect
        goalTextFiel?.textAlignment = .center
        goalTextFiel?.keyboardType = .numberPad
        goalTextFiel?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        goalTextFiel?.textColor = UIColor(hex: "201B4D")
        goalTextFiel?.attributedPlaceholder = NSAttributedString(string: popoverYourGoal, attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "919191")])
        goalTextFiel?.layer.cornerRadius = (goalTextFiel?.bounds.height ?? 0) / 8
        contentView.addSubview(goalTextFiel!)
        
        pickerView = UIPickerView()
        pickerView?.frame = CGRect(x: 30, y: 160, width: 210, height: 75)
        pickerView?.backgroundColor = .clear
        pickerView?.tintColor = UIColor(hex: "201B4D")
        pickerView?.dataSource = self
        pickerView?.delegate = self
        contentView.addSubview(pickerView!)
        
        
        let closeButton = UIButton(type: .system)
        closeButton.frame = CGRect(x: 30, y: 255, width: 90, height: 35)
        closeButton.backgroundColor = .systemRed
        closeButton.tintColor = .white
        closeButton.setTitle(cancelIptal, for: .normal)
        closeButton.layer.cornerRadius = closeButton.bounds.height / 2
        closeButton.addTarget(self, action: #selector(closePopup), for: .touchUpInside)
        contentView.addSubview(closeButton)
        
        let saveButton = UIButton(type: .system)
        saveButton.frame = CGRect(x: 150, y: 255, width: 90, height: 35)
        saveButton.backgroundColor = .systemBlue
        saveButton.tintColor = .white
        saveButton.setTitle(saveKaydet, for: .normal)
        saveButton.layer.cornerRadius = saveButton.bounds.height / 2
        saveButton.addTarget(self, action: #selector(addRoutine), for: .touchUpInside)
        contentView.addSubview(saveButton)
        
        popupContentController.view = contentView
        
        popupContentController.preferredContentSize = CGSize(width: 300, height: 320)

        let popup = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        popup.setValue(popupContentController, forKey: "contentViewController")
        
        present(popup, animated: true, completion: nil)
    }
    
    @objc func closePopup() {
        dismiss(animated: true, completion: nil)
    }
  
    
    func updatePickerForSelectedLanguage() {
        let selectedLanguage = LanguageManager.getSelectedLanguage()
        if selectedLanguage == .english {
            pickerSelect = pickerSelectEnglish
            pickerZikir = pickerZikirEnglish
            pickerPrayer = pickerPrayerEnglish
            pickerReading = pickerReadingEnglish
        } else if selectedLanguage == .turkish {
            pickerSelect = pickerSelectTurkish
            pickerZikir = pickerZikirTurkish
            pickerPrayer = pickerPrayerTurkish
            pickerReading = pickerReadingTurkish
        }
        categoryOptions = [pickerSelect, pickerZikir, pickerPrayer, pickerReading]
        pickerView?.reloadAllComponents()  // Picker görünümünü güncel seçeneklerle yenilemek için
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(categoryOptions[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCategory = categoryOptions[row]
        categoryOfRoutine = selectedCategory
    }
    
    @objc func addRoutine() {
        dismiss(animated: true, completion: nil)
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let name = nameTextFiel?.text, !name.isEmpty,
              let goal = goalTextFiel?.text, !goal.isEmpty,
              let category = categoryOfRoutine, !category.isEmpty, category != pickerSelect
        else {
            showAlert(title: alertTitleError, message: alertMessageError)
            return}
        
        let coreDataManager = CoreDataManager.shared
        let context = coreDataManager.context
        
        let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let existingRoutine = try context.fetch(fetchRequest).first
            
            if existingRoutine != nil {
                showAlert(title: alertTitleError, message: alertMessageRoutineNameError)
            } else {
                let date = dateFormatter.string(from: currentDate)
                
                let routine = RoutineData(context: context)
                
                routine.name = name
                routine.goal = goal
                routine.category = category
                routine.date = date
                routine.today = "0"
                routine.total = "0"
                
                try context.save()
                dataChanged()
                let newRoutineData = Routine(category: category, date: dateFormatter.string(from: currentDate), goal: goal, name: name, today: "0")
                dataSource.append(newRoutineData)
                self.tableView.reloadData()
            }
        } catch {
           
        }
    }
    
    func fetchCounterDataSource() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        _ = dateFormatter.string(from: currentDate)
        
        let coreDataManager = CoreDataManager.shared
        let context = coreDataManager.context
        let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
        
        do {
            let routines = try context.fetch(fetchRequest)
            
            dataSource.removeAll()
            
            for routine in routines {
                guard let name = routine.name,
                      let goal = routine.goal,
                      let category = routine.category,
                      let date = routine.date,
                      let today = routine.today else { continue }
                
                let newRoutineData = Routine(category: category, date: date, goal: goal, name: name, today: today)
                dataSource.append(newRoutineData)
                self.tableView.reloadData()
            }
            
            tableView.reloadData()
        } catch {
            
        }
    }
    
    func UpdateRoutineGoalValue(name: String) {
        let alert = UIAlertController(title: alertUpdateRoutine, message: alertUpdateRoutineMessage, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = dailyGoalPHolder
            textField.keyboardType = .numberPad
        }
        
        alert.addAction(UIAlertAction(title: updateTitle, style: .default) { [weak self] _ in
            guard let goal = alert.textFields?.last?.text, !goal.isEmpty else {
                self?.showAlert(title: alertTitleError, message: updatemessageRoutine)
                return
            }
            
            let coreDataManager = CoreDataManager.shared
            let context = coreDataManager.context
            
            let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            
            do {
                let existingRoutine = try context.fetch(fetchRequest).first
                
                if let routine = existingRoutine {
                    routine.goal = goal
                    try context.save()
                    self?.dataChanged()
                    self?.tableView.reloadData()
                    if let visibleIndexPaths = self?.tableView.indexPathsForVisibleRows {
                        for indexPath in visibleIndexPaths {
                            if let cell = self?.tableView.cellForRow(at: indexPath) as? RoutineTableViewCell {
                                if cell.routineName.text == name {
                                    cell.routineGoal.text = goal
                                    break
                                }
                            }
                        }
                    }
                } else {
                    self?.showAlert(title: alertTitleError, message: errorMesaageNotFound)
                }
            } catch {
                self?.showAlert(title: alertTitleError, message: errorMessageNotRead)
            }
        })
        
        alert.addAction(UIAlertAction(title: cancelIptal, style: .cancel))
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(alert, animated: true, completion: nil)
        }
        tableView.reloadData()
    }
    
    
    func ToolTipMessage(){
        let isPopupShown = UserDefaults.standard.bool(forKey: "routinePopupShown")
        if !isPopupShown {
            let alert = UIAlertController(title: "Tooltip", message: toolTipRoutine, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: okRoutine, style: .default))
            present(alert, animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "routinePopupShown")
        }
        
    }
    
    deinit {
       }
}




extension RoutinePage: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RoutineTableViewCell", for: indexPath) as? RoutineTableViewCell else {
            fatalError("Library Table View Cell is not defined")
        }
        let routineData = dataSource[indexPath.row]
        
        let zikirIcone = UIImage(systemName: "circle.hexagonpath")
        let prayerIcone = UIImage(systemName: "link")
        let readingIcone = UIImage(systemName: "book")
        
        let nameRoutine = routineData.name
    
        let control = routineData.category
           cell.routineName.text = nameRoutine
           cell.routineGoal.text = routineData.goal
        updateNowValue(name: nameRoutine, nowValue: cell.routineNow)
           
        
        if control == "Zikir" || control == "Dhikr"  {
           cell.iconeButton.setImage(zikirIcone, for: .normal)
           cell.iconeButton.tintColor = UIColor(hex: "2F3F32")
           cell.routineName.textColor = UIColor(hex: "2F3F32")
           cell.routineGoal.textColor = UIColor(hex: "2F3F32")
           cell.routineNow.textColor = UIColor(hex: "2F3F32")
           cell.devider.textColor = UIColor(hex: "2F3F32")
           cell.selectionStyle = .none
           
        } else if control == "Prayer" || control == "Namaz" {
           cell.iconeButton.setImage(prayerIcone, for: .normal)
           cell.iconeButton.tintColor = UIColor(hex: "A81987")
           cell.routineName.textColor = UIColor(hex: "A81987")
           cell.routineGoal.textColor = UIColor(hex: "A81987")
           cell.routineNow.textColor = UIColor(hex: "A81987")
           cell.devider.textColor = UIColor(hex: "A81987")
           cell.selectionStyle = .none
        } else {
           cell.iconeButton.setImage(readingIcone, for: .normal)
           cell.iconeButton.tintColor = UIColor(hex: "1A4CAA")
           cell.routineName.textColor = UIColor(hex: "1A4CAA")
           cell.routineGoal.textColor = UIColor(hex: "1A4CAA")
           cell.routineNow.textColor = UIColor(hex: "1A4CAA")
           cell.devider.textColor = UIColor(hex: "1A4CAA")
           cell.selectionStyle = .none
        }
        
        cell.updateButtonAction = {
            guard let name = cell.routineName.text else {return}
            self.UpdateRoutineGoalValue(name: name)
            self.tableView.reloadData()
        }
        
        cell.goToCounterButtonAction = {
            guard let name = cell.routineName.text else {return}
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let ZikirVC = storyBoard.instantiateViewController(withIdentifier: "ZikirCounter") as! ZikirCounter
            ZikirVC.zikirName = name
            ZikirVC.zikirControl = "counter"
            ZikirVC.zikirRecomended = cell.routineGoal.text
            self.navigationController?.pushViewController(ZikirVC, animated: true)
        }
        
        return cell
    }
    
    func updateNowValue(name: String, nowValue: UILabel) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDateStr = dateFormatter.string(from: currentDate)
        
        let coreDataManager = CoreDataManager.shared
        let context = coreDataManager.context
        
        let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            if let existingRoutine = try context.fetch(fetchRequest).first, let routineDateStr = existingRoutine.date {
                if let routineDate = dateFormatter.date(from: routineDateStr) {
                    let existingDateStr = dateFormatter.string(from: routineDate)
                    if existingDateStr == currentDateStr {
                        nowValue.text = existingRoutine.today
                    }
                } else {
                    return
                }
            }
        } catch {
            print("Error: \(error)")
        }
    }

    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let routineData = dataSource[indexPath.row]
        let control = routineData.category
        if control == "Prayer" || control == "Namaz" || control == "Reading" || control == "Okuma"{
            return
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let routineToDelete = dataSource[indexPath.row]
            let routineName = routineToDelete.name
            
            let coreDataManager = CoreDataManager.shared
            let context = coreDataManager.context
            
            let fetchRequestRoutine = NSFetchRequest<RoutineData>(entityName: "RoutineData")
            fetchRequestRoutine.predicate = NSPredicate(format: "name == %@", routineName)
            
            let alert = UIAlertController(title: deleteZikirRoutine, message: deleteZikirMessageRoutine, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: yesEvetRoutine, style: .default) {  _ in
                do {
                    let resultsRoutine = try context.fetch(fetchRequestRoutine)
                    if let zikirRouting = resultsRoutine.first {
                        context.delete(zikirRouting)
                        try context.save()
                        self.dataChanged()
                    }
                } catch {
                    print("Error: \(error)")
                }
                self.dataSource.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            })
            alert.addAction(UIAlertAction(title: cancelTitleRoutine, style: .default))
            present(alert, animated: true, completion: nil)
            
            
        }else {
            showAlert(title: alertTitleError, message: IamSorryMessageRoutine)
        }
    }
    
}

