//
//  BookStore.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 7.08.2023.
//

import UIKit
import PDFKit
import CoreData
import UniformTypeIdentifiers


class BookStore: UIViewController, UIDocumentPickerDelegate, UIPopoverPresentationControllerDelegate {
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var backroundView: UIView!
    
    var popoverContent: UIViewController?
    var dataSource = [Library]()
    var selectedPDFURL: URL?
    var isPopoverVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(languageDidChange), name: Notification.Name("LanguageDidChangeNotification"), object: nil)
        updateLibraryUIForSelectedLanguage()
        setupBackroundImageToVievController(imageNamed: "backround-3" , backroundView: backroundView)
            setupView()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setCurrentAndTotalValue()
    }
    
    func setupView(){
        setupTableView()
    }
    
    func setupTableView(){
        tableView.register(UINib(nibName: "LibraryTableViewCell", bundle: nil), forCellReuseIdentifier: "LibraryTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        configurateDataSource()
        tableView.reloadData()
        fetchLibraryData()
    }
    
    
    func configurateDataSource(){
        let KuraniKerim = Library( bookImage: UIImage(named: "KuraniKerim"), bookTitle: "Quran Al-Kareem", currentAndTotal: "0 / 0" )
        let SabahAksamDualari = Library(bookImage: UIImage(named: "SabahAksamDualari"), bookTitle: "Azkar al Sabah wal Masaa", currentAndTotal: "0 / 0" )
        
        dataSource.append(KuraniKerim)
        dataSource.append(SabahAksamDualari)
    
    }
    
    
    @IBAction func AddNewBook(_ sender: Any) {
        startDocumentPicker()
    }
    
    
    func setCurrentAndTotalValue() {
       
        for (index, book) in dataSource.enumerated() {
            let bookName = book.bookTitle
            let BookKey = "book_\(bookName)"
            if let savedData = UserDefaults.standard.dictionary(forKey: BookKey) as? [String: String],
               let totalPageValue = savedData["total"],
               let yourPageValue = savedData["current"] {
                guard let tableView = tableView else {
                    return
                }
                let currentAndTotal = "\(yourPageValue) / \(totalPageValue)"
                let indexPath = IndexPath(row: index, section: 0)
                guard let cell = tableView.cellForRow(at: indexPath) as? LibraryTableViewCell else {
                    return
                }
                cell.currentAndTotalPage.text = currentAndTotal
            } else {
            }
        }
    }
    
    @objc func languageDidChange() {
        updateLibraryUIForSelectedLanguage()
        tableView.reloadData()
        
        }
    
    deinit {
       }
}

    
    
extension BookStore: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryTableViewCell", for: indexPath) as? LibraryTableViewCell else {
            fatalError("Library Table View Cell is not defined")
    }
        cell.CurrentTotalTitle.text = currentTotalTitle
        cell.configureCell(dataSource[indexPath.row]) {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let ReadBookVC = storyBoard.instantiateViewController(withIdentifier: "ReadBookPage") as! ReadBookPage
            self.navigationController?.pushViewController(ReadBookVC, animated: true)
            guard let bookText = cell.bookTitle.text else { return }
            ReadBookVC.bookText = bookText
            
            
        }
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let bookToDelete = dataSource[indexPath.row]
            let bookName = bookToDelete.bookTitle
            
            let coreDataManager = CoreDataManager.shared
            let context = coreDataManager.context
            
            let fetchRequest = NSFetchRequest<DataOfLibrary>(entityName: "DataOfLibrary")
            fetchRequest.predicate = NSPredicate(format: "bookName == %@", bookName)
            
            do {
                let results = try context.fetch(fetchRequest)
                if let book = results.first {
                    let alert = UIAlertController(title: DeleteBook, message: DeleteBookDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: yesEvetBookStore, style: .default) { _ in
                        context.delete(book)
                        try? context.save()
                        self.dataSource.remove(at: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .fade)
                    })
                    alert.addAction(UIAlertAction(title: cancelBookStore, style: .default))
                    present(alert, animated: true, completion: nil)
                } else {
                    self.showAlert(title: alertTitleErrorLibrary, message: AlertBookDescription )
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
  
