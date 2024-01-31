//
//  ReadBookPage.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 7.08.2023.
//

import UIKit
import PDFKit
import CoreData


class ReadBookPage: UIViewController, UIPopoverPresentationControllerDelegate{
   
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .portrait
       }

       override var shouldAutorotate: Bool {
           return false
       }
    
    @IBOutlet var backroundView: UIView!
    @IBOutlet weak var pageNumber: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var popoverTableView: UITableView!
    @IBOutlet weak var xButton: UIBarButtonItem!
    var popoverContent: UIViewController?
    var dataSource = [Popover]()
    var pdfView: PDFView!
    var bookText:String?
    var pdfDocument: PDFDocument?
    var isPopoverVisible = false
    var popoverController: UIPopoverPresentationController?
    let scrollView = UIScrollView()
    var isGoButtonTapped = false
    var titles = [
        surahFatiha, surah1, surah2, surah3, surah4, surah5, surah6, surah7, surah8, surah9,
        surah10, surah11, surah12, surah13, surah14, surah15, surah16, surah17, surah18, surah19,
        surah20, surah21, surah22, surah23, surah24, surah25, surah26, surah27, surah28, surah29,
        surah30, surah31, surah32, surah33, surah34, surah35, surah36, surah37, surah38, surah39,
        surah40, surah41, surah42, surah43, surah44, surah45, surah46, surah47, surah48, surah49,
        surah50, surah51, surah52, surah53, surah54, surah55, surah56, surah57, surah58, surah59,
        surah60, surah61, surah62, surah63, surah64, surah65, surah66, surah67, surah68, surah69,
        surah70, surah71, surah72, surah73, surah74, surah75, surah76, surah77, surah78, surah79,
        surah80, surah81, surah82, surah83, surah84, surah85, surah86, surah87, surah88, surah89,
        surah90, surah91, surah92, surah93, surah94, surah95, surah96, surah97, surah98, surah99,
        surah100, surah101, surah102, surah103, surah104, surah105, surah106, surah107, surah108,
        surah109, surah110, surah111, surah112, surah113, chapter1, chapter2, chapter3, chapter4,
        chapter5, chapter6, chapter7, chapter8, chapter9, chapter10, chapter11, chapter12, chapter13,
        chapter14, chapter15, chapter16, chapter17, chapter18, chapter19, chapter20, chapter21,
        chapter22, chapter23, chapter24, chapter25, chapter26, chapter27, chapter28, chapter29, chapter30
    ]
    
    
    override func viewDidLoad() {
           super.viewDidLoad()

        setupBackroundImageToVievController(imageNamed: "backround-3" , backroundView: backroundView)
        
        loadLocalPDF()

        pdfView = PDFView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: tableView.bounds.height))
        pdfView.backgroundColor = .clear
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin]
        pdfView.minScaleFactor = pdfView.scaleFactorForSizeToFit
        pdfView.maxScaleFactor = 1.0
        pdfView.autoScales = true
        pdfView.displayDirection = .vertical
        pdfView.displayMode = .singlePageContinuous
        pdfView.document = pdfDocument

        tableView.tableHeaderView = pdfView
        
        
        
        isPopoverVisible = false
        pageNumber.isEnabled = false
        NotificationCenter.default.addObserver(self, selector: #selector(pdfViewPageChanged(_:)), name: .PDFViewPageChanged, object: pdfView)
    
        callCurrentPageOfThisBook()
        updatePageNumberLabel()
        fetchCounterDataSource()
       }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func loadLocalPDF() {
        guard let bookText = bookText else { return }
        
        let coreDataManager = CoreDataManager.shared
        let context = coreDataManager.context
            let fetchRequest: NSFetchRequest<DataOfLibrary> = DataOfLibrary.fetchRequest()
            
            do {
                let libraryData = try context.fetch(fetchRequest)
                
                for book in libraryData {
                    if book.bookName == bookText, let pdfData = book.pdfData {
                        let document = PDFDocument(data: pdfData)
                        pdfDocument = document
                        return
                    }
                }
                
                if let pathInMainBundle = Bundle.main.path(forResource: bookText, ofType: "pdf", inDirectory: "Books") {
                    let documentInMainBundle = PDFDocument(url: URL(fileURLWithPath: pathInMainBundle))
                    pdfDocument = documentInMainBundle
                }
            } catch {
                print("Error loading local PDF: \(error)")
            }
        
    }
    
    
    func callCurrentPageOfThisBook() {
        guard let bookName = bookText else { return }
        let bookKey = "book_\(bookName)"
        
        if let savedData = UserDefaults.standard.dictionary(forKey: bookKey) as? [String: String],
            let currentPage = savedData["current"],
            let pageNumber = Int(currentPage),
            let pdfDocument = pdfDocument,
            pageNumber <= pdfDocument.pageCount {

            let page = pdfDocument.page(at: pageNumber)
            pdfView.go(to: page ?? PDFPage())
            updatePageNumberLabel()
        }
    }
    
    
    @IBAction func openIndexGoToPage(_ sender: Any) {
        if bookText == "Quran Al-Kareem"{
            showPopupMenu()
        }else {
            showPageSelectionAlert()
        }
        
    }
    
    
    
    @IBAction func openButtonsPopover(_ sender: Any) {
        openBookmarksPopover()
    }
    
    func updatePageNumberLabel() {
            let currentPageNumber = (pdfView.currentPage?.pageRef?.pageNumber ?? 0 ) - 1
        let totalPageNumber = pdfView.document?.pageCount ?? 0
        pageNumber.text = "\(currentPageNumber) / \(totalPageNumber)"
        
        guard let bookName = bookText else {return}
        let BookKey = "book_\(bookName)"
        
        let savedData: [String: String] = [
            "total": String(describing: totalPageNumber) ,
            "current": String(describing: currentPageNumber)
        ]
        
        UserDefaults.standard.set(savedData, forKey: BookKey)
        }

    
    @objc func pdfViewPageChanged(_ notification: Notification) {
            updatePageNumberLabel()
        }

    
       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
       }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.tableView.reloadData()
        }, completion: nil)
    }
   
    @IBAction func OpenPagePopUp(_ sender: Any) {
            showPageSelectionAlert()
    }
    
    @objc func showPageSelectionAlert() {
        if presentedViewController != nil {
            dismiss(animated: false) { [weak self] in
                self?.presentPageSelectionAlert()
            }
        } else {
            presentPageSelectionAlert()
        }
    }

    func presentPageSelectionAlert() {
        let alert = UIAlertController(title: PageSelectionReadBook, message: PageSelectionMessageReadBook, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = PageNumberPHolderReadBook
            textField.keyboardType = .numberPad
        }
        
        let cancelAction = UIAlertAction(title: cancelBookStore, style: .default, handler: nil)
        alert.addAction(cancelAction)
        
        let goAction = UIAlertAction(title: goReadBook, style: .default) { [weak self] _ in
            if let pageNumberString = alert.textFields?.first?.text,
               let pageNumber = Int(pageNumberString),
               pageNumber > 1,
               pageNumber <= self?.pdfDocument?.pageCount ?? 1 {
                if self?.bookText == "Quran Al-Kareem" {
                    let page = self?.pdfDocument?.page(at: pageNumber + 1  )
                    self?.pdfView.go(to: page!)
                } else {
                    let page = self?.pdfDocument?.page(at: pageNumber  )
                    self?.pdfView.go(to: page!)
                }
                
                self?.updatePageNumberLabel()
            }
        }
        alert.addAction(goAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    deinit {
       }
}




extension ReadBookPage: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == popoverTableView {
            return dataSource.count
        }else {
          return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LibraryTableViewCell
            
            let library = Library(bookTitle: "Book Title", currentAndTotal: "0 / 0")
            cell.configureCell(library) {
                
            }
            return cell
        } else if tableView == popoverTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookMarksTableViewCell", for: indexPath) as! BookMarksTableViewCell
            let item = dataSource[indexPath.row]
            cell.bookName.text = item.bookName
            cell.bookPage.text = item.bookPage
            cell.bookDescription.text = item.bookDescription
            
            cell.buttonAction = { // Tıklama işlemini burada tanımlayın
                let bookmarkPage = self.dataSource[indexPath.row]
                let page = bookmarkPage.bookPage
                guard let pageNumber = Int(page) else { return }

                if pageNumber > 1, let pdfDocument = self.pdfDocument, pageNumber <= pdfDocument.pageCount {
                    if let bookPage = pdfDocument.page(at: pageNumber - 1)  {
                        self.pdfView.go(to: bookPage)
                        self.updatePageNumberLabel()
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }

            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    45
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       
            if editingStyle == .delete {
                let bookmarkToDelete = dataSource[indexPath.row]
                let bookPage = bookmarkToDelete.bookPage
                
                let coreDataManager = CoreDataManager.shared
                let context = coreDataManager.context
                
                let fetchRequest = NSFetchRequest<Bookmarks>(entityName: "Bookmarks")
                fetchRequest.predicate = NSPredicate(format: "bookPage == %@", bookPage)
                
                do {
                    let results = try context.fetch(fetchRequest)
                    if let page = results.first {
                        context.delete(page)
                        try context.save()
                    }
                } catch {
                    print("Error: \(error)")
                }
                self.dataSource.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
    }
    
    
    
}



   
   

