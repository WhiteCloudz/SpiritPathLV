
//  EsmaZikir.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 17.08.2023.
//

import UIKit
import CoreData

struct Update {
    var name:String
    var total:String
    var today:String
    var date:String
}

class ZikirCounter: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .portrait
       }

       override var shouldAutorotate: Bool {
           return false
       }
    
    @IBOutlet weak var backroundView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var tappedButton: UIButton!
    @IBOutlet weak var zikirImageViewDown: UIImageView!
    @IBOutlet weak var zikirTodayUp: UILabel!
    @IBOutlet weak var zikirTotalUp: UILabel!
    @IBOutlet weak var zikirNameUp: UILabel!
    @IBOutlet weak var zikirNameDown: UILabel!
    @IBOutlet weak var zikirTodayDown: UILabel!
    @IBOutlet weak var zikirTotalDown: UILabel!
    @IBOutlet weak var addZikirAmountButton: UIButton!
    @IBOutlet weak var asmaZikirDescription: UITextView!
    
    
    var updateDataClosure: (() -> Void)?
    var custom:String?
    var zikirName:String?
    var zikirCount:String?
    var zikirRecomended:String?
    var zikirControl:String?
    var totalZikir:Int = 0
    var todayZikir:Int = 0
    var goalZikir:Int = 0
    var allDailyZikir:Int = 0
    var secondTodayZikir:Int = 0
    var thirdTodayZikir:Int = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackroundImageToVievController(imageNamed: "backround-5" , backroundView: backroundView)
        firstView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.2)
        secondView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.2)
        asmaZikirDescription.isEditable = false
        setupAsmaDescriptionWithLanguage ()
        setupView()
        SetRecomendText ()
        fetchWeeklyData()
    }
    
    func setupView(){
        setupCornerRadius()
        setupCounterView()
        setupCallSavedData()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ToolTipMessage()
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setupSavedData()
        saveWeeklyData()
        fetchGoalAndNowValue()
        dataChanged()
      
    }
    
    func setupSavedData(){
        if zikirControl == "counter" {
            savedUpdateCounterData()
        }else {
            savedOtherZikirDataToNSUserDefault()
        }
    }
    
    
    func setupCallSavedData(){
        if zikirControl == "counter" {
            fetchCounterDataAndSetCounter()
        }else {
            callSavedOtherData()
            
        }
    }
    
    func setupAsmaDescriptionWithLanguage (){
        guard let zikirName = zikirName else {return}
        let selectedLanguage = LanguageManager.getSelectedLanguage()
        if selectedLanguage == .english {
        setZikirDescriptionEnglish(ZikirName: zikirName, textView: asmaZikirDescription)
        }else if selectedLanguage == .turkish {
        setZikirDescriptionTurkish(ZikirName: zikirName, textView: asmaZikirDescription)
        }
    }
    
    func setupCounterView(){
        switch zikirControl {
        case "counter":
            zikirTotalDown.isHidden = true
            zikirTodayDown.isHidden = true
            asmaZikirDescription.isHidden = true
        case "controlZikir":
            zikirTotalUp.isHidden = true
            zikirTodayUp.isHidden = true
            asmaZikirDescription.isHidden = true
        default:
            zikirTotalUp.isHidden = true
            zikirTodayUp.isHidden = true
            zikirNameUp.text = zikirName
           
        }
    }
    
    
    @IBAction func TappedButton(_ sender: Any) {
        self.view.frame.origin.y = 0
        totalZikir += 1
        setupTudayZikir()
        allDailyZikir += 1
        updateDataClosure?()
        if zikirControl == "counter" {
            zikirTodayUp.text = String(describing: todayZikir)
            zikirTotalUp.text = String(describing: totalZikir)
        } else {
            zikirTodayDown.text = String(describing: todayZikir)
            zikirTotalDown.text = String(describing: totalZikir)
        }
        SetRecomendText()
        setupCounterProgressBar()
        addHapticFeedback()
        callPlaySound()
        
    }
    
    
    func setupTudayZikir(){
        guard let recomend = zikirRecomended else {return}
        switch zikirControl {
        case "counter":
        if todayZikir > goalZikir {
           todayZikir += 1
           secondTodayZikir += 1
        }else if secondTodayZikir > goalZikir{
           todayZikir += 1
           thirdTodayZikir += 1
        }else{
           todayZikir += 1
    }
        case "controlAsma":
            guard let recommended = Int(recomend) else { return }
               if todayZikir > recommended {
                  todayZikir += 1
                  secondTodayZikir += 1
               }else if secondTodayZikir > recommended{
                todayZikir += 1
                thirdTodayZikir += 1
               }else{
                  todayZikir += 1
    }
        default:
           return
        }
        
    }
    
    
    
    func setupCounterProgressBar(){
        
        switch zikirControl {
        case "counter":
            if todayZikir > goalZikir {
                drawProgressCircle(showWithView: firstView, goal: goalZikir, today: secondTodayZikir)
            } else if secondTodayZikir > goalZikir  {
                drawProgressCircle(showWithView: firstView, goal: goalZikir, today: thirdTodayZikir)
            }else {
                drawProgressCircle(showWithView: firstView, goal: goalZikir, today: todayZikir)
            }
        case "controlAsma":
            guard let recommended = Int(zikirRecomended ?? "0") else { return }
            if todayZikir > recommended {
                drawProgressCircle(showWithView: secondView, goal: recommended, today: secondTodayZikir)
            } else if secondTodayZikir > recommended  {
                drawProgressCircle(showWithView: secondView, goal: recommended, today: thirdTodayZikir)
            }else {
                drawProgressCircle(showWithView: secondView, goal: recommended, today: todayZikir)
            }
            
        default:
           return
        }
        
    }
    
    
    
    
    func addHapticFeedback() {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
    
    
    @IBAction func setupAddZikirAmountButton(_ sender: Any) {
        
        let alert = UIAlertController(title: addZikirAmountLabel, message: addZikirAmountDescription, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = amountOfZikirPHolder
            textField.keyboardType = .numberPad
        }
       
        alert.addAction(UIAlertAction(title: addAmount, style: .default) { [weak self] _ in
            guard let self = self,
                  let zikirAmount = alert.textFields?.first?.text, !zikirAmount.isEmpty else {
                self?.showAlert(title: alertTitleErrorZikir, message: updatemessageZikir)
                return}
            if zikirAmount.count > 8 {
                self.showAlert(title: alertTitleErrorZikir, message: errorDescriptionZikir)
            }else {
                guard let amount = Int(zikirAmount) else {return}
                
                self.totalZikir += amount
                self.todayZikir += amount
                self.allDailyZikir += amount
                zikirTodayUp.text = String(describing: todayZikir)
                zikirTotalUp.text = String(describing: totalZikir)
                zikirTodayDown.text = String(describing: todayZikir)
                zikirTotalDown.text = String(describing: totalZikir)
                setupCounterProgressBar()
            }
        })
        alert.addAction(UIAlertAction(title: zikirCancel, style: .cancel))
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func resetCounter(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let alert = UIAlertController(title: resetCounterLabel, message: resetCounterDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reset", style: .default) { [weak self] _ in
                self?.zikirTodayUp.text = "0"
                self?.zikirTotalUp.text = "0"
                self?.zikirTodayDown.text = "0"
                self?.zikirTotalDown.text = "0"
                self?.allDailyZikir = 0
                self?.totalZikir = 0
                self?.todayZikir = 0
                self?.setupCounterProgressBar()
                
            })
            alert.addAction(UIAlertAction(title: zikirCancel, style: .default))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func fetchCounterDataAndSetCounter() {
        guard let nameZikir = zikirName else {return}
        let coreDataManager = CoreDataManager.shared
        let context = coreDataManager.context
        let fetchRequest = NSFetchRequest<RoutineData>(entityName: "RoutineData")
        fetchRequest.predicate = NSPredicate(format: "name = %@", nameZikir)
        
        do {
            let NewZikir = try context.fetch(fetchRequest)
            
            for zikir in NewZikir {
                guard let zikirName = zikir.name,
                      let zikirDate = zikir.date,
                      let zikirTotal = zikir.total,
                      let zikirGoal = zikir.goal,
                      let zikirToday = zikir.today else {return}
                guard let total = Int(zikirTotal), let today = Int(zikirToday) else {return}
                
                controlTodayDate(zikirDate:zikirDate, today:zikirToday, todayInt:today)
                zikirNameUp.text = zikirName
                zikirTotalUp.text = zikirTotal
                totalZikir = total
                goalZikir = Int(zikirGoal) ?? 0
                
            }
            
        } catch {
            
        }
    }

   
    
    func savedUpdateCounterData() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateNow = dateFormatter.string(from: currentDate)
        
        guard let name = zikirName,
              let counterTotal = zikirTotalUp.text,
              let counterToday = zikirTodayUp.text else {return}
        
        let coreDataManager = CoreDataManager.shared
        let context = coreDataManager.context
        
        if zikirControl == "counter" {
            let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            
            do {
                if let zikir = try context.fetch(fetchRequest).first {
                    zikir.today = counterToday
                    zikir.total = counterTotal
                    zikir.date = dateNow
                    
                    try context.save()
                    print("Data updated successfully")
                } else {
                    showAlert(title: alertTitleErrorZikir, message: "Data not found for \(name)")
                }
            } catch {
                showAlert(title: alertTitleErrorZikir, message: dataNotFount)
            }
        }
    }
    
    func savedOtherZikirDataToNSUserDefault() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let controlDate = dateFormatter.string(from: currentDate)
        
        guard let total = zikirTotalDown.text,
              let today = zikirTodayDown.text,
              let zikirName = zikirName else {
            return
        }
        let CounterKey = "zikir_\(zikirName)"
        
        let savedData: [String: String] = [
            "totalZikir": total,
            "todayZikir": today,
            "zikirName": zikirName,
            "zikirDate": controlDate
        ]
        UserDefaults.standard.set(savedData, forKey: CounterKey)
    }
    
    func callSavedOtherData() {
        guard let zikirName = zikirName else {
            return
        }
        
        let CounterKey = "zikir_\(zikirName)"
        
        if let savedData = UserDefaults.standard.dictionary(forKey: CounterKey) as? [String: String] {
            
            if let zikirTotal = savedData["totalZikir"],
               let zikirToday = savedData["todayZikir"],
               let zikirDate = savedData["zikirDate"],
               let total = Int(zikirTotal),
               let today = Int(zikirToday) {
                zikirTotalDown.text = zikirTotal
                controlTodayDate(zikirDate: zikirDate, today: zikirToday, todayInt: today)
                totalZikir = total
                setupAsmaDescriptionWithLanguage ()
            }
        } else {
            zikirTotalDown.text = zikirCount
            zikirTodayDown.text = "0"
            totalZikir = 0
            todayZikir = 0
            setupAsmaDescriptionWithLanguage ()
        }
    }
    
    func SetRecomendText () {
        guard let recomended = zikirRecomended else {return}
        if zikirControl == "controlAsma"{
            zikirNameDown.text = "\(recomendedAmound)  \(recomended)"
        }
    }
   
    
    func ToolTipMessage(){
        let isPopupShown = UserDefaults.standard.bool(forKey: "popupShown")
        if !isPopupShown {
            let alert = UIAlertController(title: "Tooltip", message: resetToolTip, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: okRoutine, style: .default))
            present(alert, animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "popupShown")
        }
    }
  
    func setupCornerRadius(){
        firstView.layer.cornerRadius = firstView.bounds.height / 30
        secondView.layer.cornerRadius = secondView.bounds.height / 30
    
    }
    
    func controlTodayDate(zikirDate:String, today:String, todayInt:Int){
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let controlDate = dateFormatter.string(from: currentDate)
        
        if zikirDate == controlDate {
            zikirTodayUp.text = today
            zikirTodayDown.text = today
            todayZikir = todayInt
            allDailyZikir = todayInt
        }else {
            zikirTodayUp.text = "0"
            zikirTodayDown.text = "0"
            todayZikir = 0
            allDailyZikir = 0
        }
        
    }
 

    
    func saveWeeklyData() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dayOfWeekFormatter = DateFormatter()
        dayOfWeekFormatter.dateFormat = "EEEE"
        let dayOfWeek = dayOfWeekFormatter.string(from: currentDate)
        
        let coreDataManager = CoreDataManager.shared
        let context = coreDataManager.context
        
        let fetchRequestForToday: NSFetchRequest<DataOfWeek> = DataOfWeek.fetchRequest()
        fetchRequestForToday.predicate = NSPredicate(format: "dayOfWeek == %@", dayOfWeek)
        
        do {
            let results = try context.fetch(fetchRequestForToday)
            for object in results {
                context.delete(object)
            }
            
            let newWeeklyData = DataOfWeek(context: context) // Yeni kayıt oluştur
            newWeeklyData.totalValue = String(describing: allDailyZikir)
            newWeeklyData.dayOfWeek = dayOfWeek
            newWeeklyData.date = currentDate
            try context.save()
        } catch {
            print("Hata: \(error.localizedDescription)")
        }
    }
    
    func fetchWeeklyData(){
               let currentDate = Date()
               let dateFormatter = DateFormatter()
               dateFormatter.dateFormat = "yyyy-MM-dd"
               
               let dayOfWeekFormatter = DateFormatter()
               dayOfWeekFormatter.dateFormat = "EEEE"
               let dayOfWeek = dayOfWeekFormatter.string(from: currentDate)
               
               let coreDataManager = CoreDataManager.shared
               let context = coreDataManager.context
               
               let fetchRequest: NSFetchRequest<DataOfWeek> = DataOfWeek.fetchRequest()
               fetchRequest.predicate = NSPredicate(format: "dayOfWeek == %@", dayOfWeek)
               
               do {
                   let results = try context.fetch(fetchRequest)
                   if let existingRoutine = results.first {
                       let total = Int(existingRoutine.totalValue ?? "0")
                       allDailyZikir = total ?? 0
                   }
               } catch {
                   print("Hata: \(error.localizedDescription)")
               }
               
           }
    
    
    func drawProgressCircle(showWithView: UIView, goal:Int, today:Int) {
        let scaleFactor: CGFloat = 0.8
        let lineWidth: CGFloat = 20.0
        let centerPoint = CGPoint(x: showWithView.bounds.width / 2, y: showWithView.bounds.height / 2)
        let radius = (min(showWithView.bounds.width, showWithView.bounds.height) - lineWidth) / 2.5 * scaleFactor
        
        let totalProgress = CGFloat(goal)
        let currentProgress = CGFloat(today)
        
        let progressPath = UIBezierPath(arcCenter: centerPoint,
                                        radius: radius,
                                        startAngle: -CGFloat.pi / 2,
                                        endAngle: 2 * CGFloat.pi * currentProgress / totalProgress - CGFloat.pi / 2,
                                        clockwise: true)
        
        showWithView.layer.sublayers?.filter { $0 is CAShapeLayer }.forEach { $0.removeFromSuperlayer() }
        
        let progressLayer = CAShapeLayer()
        progressLayer.path = progressPath.cgPath
        progressLayer.strokeColor = UIColor(hex: "32ACE4").cgColor
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineWidth = lineWidth
        progressLayer.lineCap = .round
        
        showWithView.layer.addSublayer(progressLayer)
    
        progressLayer.frame = showWithView.bounds
        progressLayer.bounds = showWithView.bounds
    }
    
    
    func callPlaySound() {
        guard let recommended = Int(zikirRecomended ?? "0") else { return }
        if todayZikir == goalZikir || todayZikir == recommended || secondTodayZikir == goalZikir || secondTodayZikir == recommended || thirdTodayZikir == goalZikir || thirdTodayZikir == recommended  {
            playVibration()
        }
    }

    func playVibration() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
          
    
    deinit {
       }
    
}
 
