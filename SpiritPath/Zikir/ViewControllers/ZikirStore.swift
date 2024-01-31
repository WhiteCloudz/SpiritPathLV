//
//  YourViewController.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 10/8/23.
//

import UIKit
import CoreData
import UniformTypeIdentifiers

class ZikirViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate  {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .portrait
       }

       override var shouldAutorotate: Bool {
           return false
       }
    
    @IBOutlet var backroundView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var isPopoverVisible = false
    var popoverContent: UIViewController?
    var counterData = [ZikirData]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateZikirUIForSelectedLanguage()
        segmentedControl.setTitle(segmentFirstTitle, forSegmentAt: 0)
        segmentedControl.setTitle(segmentSecondTitle, forSegmentAt: 1)
        NotificationCenter.default.addObserver(self, selector: #selector(languageDidChange), name: Notification.Name("LanguageDidChangeNotification"), object: nil)
        setupBackroundImageToVievController(imageNamed: "backround-5" , backroundView: backroundView)
        setupView()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchDataSource()
        updateCellsZikirFromUserDefaults()
        ToolTipMessage()
    }

    
    func setupView() {
        setupSegmentedControl()
        setupTableView()
    }
    
    func setupSegmentedControl() {
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "ZikirViewCell", bundle: nil), forCellReuseIdentifier: "ZikirViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        fetchDataSource()
        updateCellsZikirFromUserDefaults()
    }
    
    @IBAction func addNewZikir(_ sender: Any) {
        AddZikir()
    }
    
    
    
    @objc func AddZikir() {
            dismiss(animated: true, completion: nil)
            
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.string(from: currentDate)
            
            let alert = UIAlertController(title: addNewZikirLabel, message: addNewZikirDescription, preferredStyle: .alert)
            alert.addTextField { textField in
                textField.placeholder = zikirNamePHolder
            }
            
            alert.addTextField { textField in
                textField.placeholder = DailyGoalpHolder
                textField.keyboardType = .numberPad
            }
            
            alert.addAction(UIAlertAction(title: addZikirLabel, style: .default) { [weak self] _ in
                guard let self = self,
                      let zikirName = alert.textFields?.first?.text, !zikirName.isEmpty, let goal = alert.textFields?.last?.text else {
                    self?.showAlert(title: alertTitleErrorZikir, message: updatemessageZikir)
                    return
                }
                
                let coreDataManager = CoreDataManager.shared
                let context = coreDataManager.context
                
                let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "name == %@", zikirName)
                
                do {
                    let existingZikir = try context.fetch(fetchRequest).first
                    
                    if existingZikir != nil {
                        self.showAlert(title: alertTitleErrorZikir, message: enterANewNAme)
                    } else {
                        let zikir = RoutineData(context: context)
                       
                        zikir.name = zikirName
                        zikir.today = "0"
                        zikir.total = "0"
                        zikir.date = date
                        zikir.category = "Dhikr"
                        if goal.isEmpty{
                        zikir.goal = "0"
                        }else {
                        zikir.goal = goal
                        }
                        
                        try context.save()
                        dataChanged()
                        let newZikirData = ZikirData(ZikirName: zikirName, ZikirDescription: "", ZikirRecomend: "", ZikirToday: "0", SavedDate: dateFormatter.string(from: currentDate), ZikirTotal: "0", ZikirControl: "")
                        counterData.append(newZikirData)
                        self.tableView.reloadData()
                        
                       
                    }
                } catch {
                    self.showAlert(title: alertTitleErrorZikir, message: errorMessageNotRead)
                }
            })
            
            alert.addAction(UIAlertAction(title: zikirCancel, style: .cancel))
            present(alert, animated: true, completion: nil)
        }

       
    
    func fetchDataSource() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let controlDate = dateFormatter.string(from: currentDate)
        
        let coreDataManager = CoreDataManager.shared
        let context = coreDataManager.context
        let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
        
        do {
            let NewZikir = try context.fetch(fetchRequest)
            
            counterData.removeAll()
            
            for zikir in NewZikir {
                guard let zikirName = zikir.name,
                      let zikirDate = zikir.date,
                      let zikirTotal = zikir.total,
                      let zikirCategory = zikir.category,
                      let zikirToday = zikir.today else { continue }
                
                let todayZikir = controlDate == zikirDate ? zikirToday : "0"
                switch segmentedControl.selectedSegmentIndex {
                case 0:
                    if zikirCategory == "Zikir" || zikirCategory == "Dhikr"{
                        counterData.append(ZikirData(ZikirName: zikirName, ZikirDescription: "", ZikirRecomend: "", ZikirToday: todayZikir, SavedDate: zikirDate, ZikirTotal: zikirTotal, ZikirControl: ""))
                    }
                default:
                    break
                }
            }
            
            tableView.reloadData()
        } catch {
            
        }
    }
    
    func UpdateCounterData() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let controlDate = dateFormatter.string(from: currentDate)
        
        let coreDataManager = CoreDataManager.shared
        let context = coreDataManager.context
        let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
        
        var selectedSegmentData: [ZikirData]
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            selectedSegmentData = counterData
        case 1:
            selectedSegmentData = asmaListEnglish
        default:
            selectedSegmentData = []
        }
        
        do {
            let NewZikir = try context.fetch(fetchRequest)
            
            for zikir in NewZikir {
                guard let zikirName = zikir.name,
                      let zikirDate = zikir.date,
                      let zikirTotal = zikir.total,
                      let zikirToday = zikir.today else { continue }
                let todayAndTotal = "\(zikirToday) / \(zikirTotal)"
                let controlTodayAndTotal = "\("0") / \(zikirTotal)"
                
                if let index = selectedSegmentData.firstIndex(where: { $0.ZikirName == zikirName }) {
                    selectedSegmentData[index].ZikirTotal = zikirTotal
                    selectedSegmentData[index].ZikirToday = zikirToday
                    
                    
                    let indexPath = IndexPath(row: index, section: 0)
                    if let cell = tableView.cellForRow(at: indexPath) as? ZikirViewCell {
                        if controlDate == zikirDate {
                           cell.zikirTodayAndTotal.text = todayAndTotal
                        }else {
                           cell.zikirTodayAndTotal.text = controlTodayAndTotal
                        }
                    }
                }
            }
        } catch {
        }
    }
    
    
    
    func updateCellsZikirFromUserDefaults() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let controlDate = dateFormatter.string(from: currentDate)
        
        let selectedList: [ZikirData]
        
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            selectedList = asmaListEnglish
        default:
            return
        }
        
        for (index, zikir) in selectedList.enumerated() {
            let nameEsma = zikir.ZikirName
            let CounterKey = "zikir_\(nameEsma)"
            
            if let savedData = UserDefaults.standard.dictionary(forKey: CounterKey) as? [String: String],
               let totalValue = savedData["totalZikir"],
               let todayValue = savedData["todayZikir"],
               let savedDate = savedData["zikirDate"] {
                zikir.ZikirTotal = totalValue
                let todayAndTotal = "\(todayValue) / \(todayValue)"
                let controlTodayAndTotal = "\("0") / \(todayValue)"
                
                let indexPath = IndexPath(row: index, section: 0)
                
                if let cell = tableView.cellForRow(at: indexPath) as? ZikirViewCell {
                    if controlDate == savedDate {
                       cell.zikirTodayAndTotal.text = todayAndTotal
                    }else {
                       cell.zikirTodayAndTotal.text = controlTodayAndTotal
                    }
                }
            }
        }
    }
    
    
    @objc func languageDidChange() {
        tableView.reloadData()
        viewDidLoad()
        }
    
    deinit {
       }
}


