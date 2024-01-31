//
//  ReadBookPagePopovers.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 10/27/23.
//
import UIKit
import PDFKit
import CoreData

extension ReadBookPage{

    func openBookmarksPopover() {

        let popoverContent = UIViewController()
        popoverContent.modalPresentationStyle = .popover
        popoverContent.preferredContentSize = CGSize(width: 250, height: 500)
        setupBackroundImageToVievController(imageNamed: "backround-5" , backroundView: popoverContent.view)
        
        let popoverController = popoverContent.popoverPresentationController
        popoverController?.delegate = self
        popoverController?.permittedArrowDirections = []
        
        let goToPageButton = UIButton(type: .system)
        goToPageButton.frame = CGRect(x: 15, y: 15, width: 220, height: 40)
        goToPageButton.backgroundColor = UIColor(hex: "A838DB")
        goToPageButton.tintColor = .white
        goToPageButton.setTitle(addBookmark, for: .normal)
        goToPageButton.layer.cornerRadius = goToPageButton.bounds.height / 4
        goToPageButton.addTarget(self, action: #selector(addBookmarks), for: .touchUpInside)
        popoverContent.view.addSubview(goToPageButton)
        
        let tableView = UITableView(frame: CGRect(x: 5, y: 65, width: 240, height: 430)) 
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "BookMarksTableViewCell", bundle: nil), forCellReuseIdentifier: "BookMarksTableViewCell")
        popoverContent.view.addSubview(tableView)
        popoverTableView = tableView
        popoverTableView.rowHeight = 20

        let screenWidth = UIScreen.main.bounds.width
        let scaledWidth: CGFloat = 250
        let rightMargin: CGFloat = 0
        let topMargin: CGFloat = 100
        
        popoverController?.sourceView = self.view
        popoverController?.sourceRect = CGRect(x: screenWidth - scaledWidth - rightMargin, y: topMargin, width: scaledWidth, height: 0)
        
        present(popoverContent, animated: true, completion: nil)
    }

    
    @objc func addBookmarks(){
        dismiss(animated: true, completion: nil)
        let alert = UIAlertController(title: AddExplanationPopoverReadBook, message: AddExplanationdescriptionPopoverReadBook, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = ExplanationPHolderReadBook
        }
        
        let cancelAction = UIAlertAction(title: cancelBookStore, style: .default, handler: nil)
        alert.addAction(cancelAction)
        
        let goAction = UIAlertAction(title: enterReadBook, style: .default) { [weak self] _ in
            
            let coreDataManager = CoreDataManager.shared
            let context = coreDataManager.context
         let currentPageNumber = (self?.pdfView.currentPage?.pageRef?.pageNumber ?? 0)
         guard let bookName = self?.bookText else {return}
         let description = alert.textFields?.first?.text
         let fetchRequest: NSFetchRequest<Bookmarks> = Bookmarks.fetchRequest()
         let pageNumber = String(describing: currentPageNumber)
         fetchRequest.predicate = NSPredicate(format: "bookPage == %@", pageNumber)
         
         do {
             let existingZikir = try context.fetch(fetchRequest).first
             
             if existingZikir != nil {
                 self?.showAlert(title: alertTitleErrorLibrary, message: errorMessageBookmarkReadBook)
             } else {
                 let book = Bookmarks(context: context)
                 book.bookName = bookName
                 book.bookDescription = description
                 book.bookPage = String(describing: currentPageNumber)
                 try context.save()
                 
                 let page = String(describing: currentPageNumber)
                 let newBookmark = Popover(bookName: bookName, bookPage: page, bookDescription: description ?? "String Data")
                 self?.dataSource.append(newBookmark)
                 self?.tableView.reloadData()
                 
                 self?.showAlert(title: SuccessReadBook, message: addSuccessfulyBookmarkReadBook)
             }
         } catch {
             self?.showAlert(title: alertTitleErrorLibrary, message: errorMessageNotRead )
         }
        }
        alert.addAction(goAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
  
    func fetchCounterDataSource() {
        let coreDataManager = CoreDataManager.shared
        let context = coreDataManager.context
            let fetchRequest: NSFetchRequest<Bookmarks> = Bookmarks.fetchRequest()
        
            guard let name = bookText else {return}
            let predicate = NSPredicate(format: "bookName == %@", name)
            fetchRequest.predicate = predicate
           
        do {
                let bookmarks = try context.fetch(fetchRequest)
                
                dataSource.removeAll()
                
                for bookmark in bookmarks {
                    guard let bookName = bookmark.bookName,
                          let bookPage = bookmark.bookPage,
                          let bookDescription = bookmark.bookDescription else { continue }
                  
                        dataSource.append(Popover(bookName: bookName, bookPage: bookPage, bookDescription: bookDescription))
                
                }
                
                tableView.reloadData()
            } catch {
               
            }
        }
    
    
}
