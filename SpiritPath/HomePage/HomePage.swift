import UIKit
import CoreData

class HomePage: UIViewController, UIPopoverPresentationControllerDelegate{
    
    @IBOutlet var backroundView: UIView!
    @IBOutlet weak var zikirView: UIView!
    @IBOutlet weak var prayerView: UIView!
    @IBOutlet weak var readingView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var zikirChartView: UIView!
    @IBOutlet weak var prayerChartView: UIView!
    @IBOutlet weak var readingChartView: UIView!
    @IBOutlet weak var weeklyChartView: UIView!
   
    
    
    @IBOutlet weak var zikirGoalAndNow: UILabel!
    @IBOutlet weak var prayerGoalAndNow: UILabel!
    @IBOutlet weak var readingGoalAndNow: UILabel!
    
    var selectedLanguage: Language = .english
    var dataSourceRoutine = [Routine]()
    var dataSourceCounter = [ZikirData]()
    var routineChackDataSource = [Routine]()
    var popoverProgressBar = UIProgressView()
    var languages: [Language] = []
    var selectedLanguageIndex: Int = 0
    var reminderChoise = ""
    var isPopoverVisible = false
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .portrait
       }

       override var shouldAutorotate: Bool {
           return false
       }

        override func viewDidLoad() {
            super.viewDidLoad()
            self.tabBarController?.tabBar.isHidden = false
            languages = LanguageManager.availableLanguages()
            updateHomePageUIForSelectedLanguage()
            updateLibraryUIForSelectedLanguage()
            updateZikirUIForSelectedLanguage()
            changeNameOfTabBar()
            setupBackroundImageToVievController(imageNamed: "backround-5" , backroundView: backroundView)
            saveWeeklyData()
            fetchGoalAndNowValue()
            setupTableView()
        }
    
    func updateUIForSelectedLanguage() {
            let selectedLanguage = LanguageManager.getSelectedLanguage()
            if selectedLanguage == .english {
                
            } else if selectedLanguage == .turkish {
               
            }
            
         
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        openLanguageSelectionMenuFirstTime()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        fetchGoalAndNowValue()
        saveWeeklyData()
        tableView.reloadData()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dataChanged()
    }
    
    @IBAction func openSettingsAndTipPage(_ sender: Any) {
        openSettingsPopover()
    }
    
    
    func setupTableView(){
        tableView.register(UINib(nibName: "DailyChartTableViewCell", bundle: nil), forCellReuseIdentifier: "DailyChartTableViewCell")
        tableView.register(UINib(nibName: "WeeklyChartTableViewCell", bundle: nil), forCellReuseIdentifier: "WeeklyChartTableViewCell")
        tableView.register(UINib(nibName: "BuildYourRoutineTableViewCell", bundle: nil), forCellReuseIdentifier: "BuildYourRoutineTableViewCell")
        tableView.register(UINib(nibName: "randomAsmaTableViewCell", bundle: nil), forCellReuseIdentifier: "randomAsmaTableViewCell")
        tableView.register(UINib(nibName: "SettingsButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsButtonTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
       
    }
    
    func changeNameOfTabBar() {
        guard let tabItems = self.tabBarController?.tabBar.items else {
            return
        }

        tabItems[0].title = tabBarHome
        tabItems[1].title = tabBarRoutine
        tabItems[2].title = tabBarDhikr
        tabItems[3].title = tabBarLibrary
    }
    
}

extension HomePage: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DailyChartTableViewCell", for: indexPath) as! DailyChartTableViewCell
              
            let chartViewZikir = ChartView()
            chartViewZikir.backgroundColor = .clear
            chartViewZikir.data = [Double(zikirGoalValue), Double(zikirNowValue)]
            chartViewZikir.color = "FE2D54"
            cell.zikirButton.setTitle(zikirCellName, for: .normal)
            cell.zikirView.subviews.forEach { $0.removeFromSuperview() }
            cell.zikirView.addSubview(chartViewZikir)
            chartViewZikir.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                chartViewZikir.centerXAnchor.constraint(equalTo: cell.zikirView.centerXAnchor),
                chartViewZikir.centerYAnchor.constraint(equalTo: cell.zikirView.centerYAnchor),
                chartViewZikir.widthAnchor.constraint(equalToConstant: 44),
                chartViewZikir.heightAnchor.constraint(equalToConstant: 80)
            ])

            cell.zikirButtonAction = {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let ZikirVC = storyBoard.instantiateViewController(withIdentifier: "ZikirViewController") as! ZikirViewController
                self.navigationController?.pushViewController(ZikirVC, animated: true)
            }
            
            let chartViewPrayer = ChartView()
            chartViewPrayer.backgroundColor = .clear
            chartViewPrayer.color = "9243E1"
            cell.prayerButton.setTitle(prayerCellName, for: .normal)
            chartViewPrayer.data = [Double(prayerGoalValue), Double(prayerNowValue)]
            cell.prayerView.subviews.forEach { $0.removeFromSuperview() }
            cell.prayerView.addSubview(chartViewPrayer)

            chartViewPrayer.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                chartViewPrayer.centerXAnchor.constraint(equalTo: cell.prayerView.centerXAnchor),
                chartViewPrayer.centerYAnchor.constraint(equalTo: cell.prayerView.centerYAnchor),
                chartViewPrayer.widthAnchor.constraint(equalToConstant: 44),
                chartViewPrayer.heightAnchor.constraint(equalToConstant: 80)
            ])

            cell.prayerButtonAction = {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let RoutineVC = storyBoard.instantiateViewController(withIdentifier: "RoutinePage") as! RoutinePage
                self.navigationController?.pushViewController(RoutineVC, animated: true)
            }

            let chartViewReading = ChartView()
            chartViewReading.backgroundColor = .clear
            chartViewReading.color = "038BFC"
            cell.readingButton.setTitle(readingCellName, for: .normal)
            chartViewReading.data = [Double(readingGoalValue), Double(readingNowValue)]
            cell.readingView.subviews.forEach { $0.removeFromSuperview() }
            cell.readingView.addSubview(chartViewReading)

            chartViewReading.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                chartViewReading.centerXAnchor.constraint(equalTo: cell.readingView.centerXAnchor),
                chartViewReading.centerYAnchor.constraint(equalTo: cell.readingView.centerYAnchor),
                chartViewReading.widthAnchor.constraint(equalToConstant: 44),
                chartViewReading.heightAnchor.constraint(equalToConstant: 80)
            ])

            cell.readingButtonAction = {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let RoutineVC = storyBoard.instantiateViewController(withIdentifier: "RoutinePage") as! RoutinePage
                self.navigationController?.pushViewController(RoutineVC, animated: true)
            }
            return cell
        
        }else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeeklyChartTableViewCell", for: indexPath) as! WeeklyChartTableViewCell
            for subview in cell.weeklyChartView.subviews {
                subview.removeFromSuperview()
            }
            let chartViewWeekly = AllZikirChartView()
            chartViewWeekly.translatesAutoresizingMaskIntoConstraints = false
            chartViewWeekly.backgroundColor = UIColor.clear
            cell.weeklyChartView.addSubview(chartViewWeekly)
            chartViewWeekly.leadingAnchor.constraint(equalTo: cell.weeklyChartView.leadingAnchor, constant: 16).isActive = true
            chartViewWeekly.trailingAnchor.constraint(equalTo: cell.weeklyChartView.trailingAnchor, constant: -16).isActive = true
            chartViewWeekly.topAnchor.constraint(equalTo: cell.weeklyChartView.topAnchor, constant: 35).isActive = true
            chartViewWeekly.bottomAnchor.constraint(equalTo: cell.weeklyChartView.bottomAnchor, constant: -35).isActive = true
            cell.isUserInteractionEnabled = false
            return cell
        }else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "randomAsmaTableViewCell", for: indexPath) as! randomAsmaTableViewCell
            let selectedLanguage = LanguageManager.getSelectedLanguage()
            if selectedLanguage == .english {
                let randomIndex = asmaListEnglish[Int.random(in: 0..<asmaListEnglish.count)]
                cell.asmaName.text = String(randomIndex.ZikirName)
                cell.asmaDescription.text = String(randomIndex.ZikirDescription)
                cell.buttonAction = {
                    let randomIndex = asmaListEnglish[Int.random(in: 0..<asmaListEnglish.count)]
                    cell.asmaName.text = String(randomIndex.ZikirName)
                    cell.asmaDescription.text = String(randomIndex.ZikirDescription)
                }
                return cell
            }else if selectedLanguage == .turkish {
                let randomIndex = asmaListTurkish[Int.random(in: 0..<asmaListTurkish.count)]
                cell.asmaName.text = String(randomIndex.ZikirName)
                cell.asmaDescription.text = String(randomIndex.ZikirDescription)
                cell.buttonAction = {
                    let randomIndex = asmaListTurkish[Int.random(in: 0..<asmaListTurkish.count)]
                    cell.asmaName.text = String(randomIndex.ZikirName)
                    cell.asmaDescription.text = String(randomIndex.ZikirDescription)
                }
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 175
        }else if indexPath.row == 1 {
            return 250
        }else if indexPath.row == 2 {
            return 370
        }
        return 150
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
            
            let newWeeklyData = DataOfWeek(context: context)
            let total = String(describing: zikirNowValue + prayerNowValue + readingNowValue)
            newWeeklyData.totalValue = String(describing: total)
            newWeeklyData.dayOfWeek = dayOfWeek
            newWeeklyData.date = currentDate
            try context.save()
        } catch {
            print("Hata: \(error.localizedDescription)")
        }
    }
    
   
}




