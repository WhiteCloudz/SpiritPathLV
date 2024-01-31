//
//  BookStoreNewBookPcker.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/2/23.
//

import UIKit
import PDFKit
import CoreData
import UniformTypeIdentifiers

extension BookStore: UIDocumentInteractionControllerDelegate {
    
     func startDocumentPicker() {
        dismiss(animated: true, completion: nil)
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.pdf], asCopy: true)
            documentPicker.delegate = self
            present(documentPicker, animated: true, completion: nil)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let pdfURL = urls.first else {
                print("No PDF file selected or an incorrect file was chosen.")
                return
            }

            let activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.center = view.center
            activityIndicator.color = .black
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()

            DispatchQueue.global().async {
                if let pdfURL = urls.first {
                    let fileNameWithoutExtension = pdfURL.deletingPathExtension().lastPathComponent

                    let fetchRequest = NSFetchRequest<DataOfLibrary>(entityName: "DataOfLibrary")
                    fetchRequest.predicate = NSPredicate(format: "bookName == %@", fileNameWithoutExtension)

                    DispatchQueue.main.async {
                        let coreDataManager = CoreDataManager.shared
                        let context = coreDataManager.context

                        do {
                            let existingBooks = try context.fetch(fetchRequest)
                            if existingBooks.count > 0 {
                                DispatchQueue.main.async {
                                    activityIndicator.stopAnimating()
                                    activityIndicator.removeFromSuperview()
                                    self.showAlert(title: alertTitleErrorLibrary, message: errorRegisteredReadBook)
                                }
                                return
                            }
                        } catch {
                            print("Book query error: \(error)")
                        }

                        if let entity = NSEntityDescription.entity(forEntityName: "DataOfLibrary", in: context) {
                            let newBook = DataOfLibrary(entity: entity, insertInto: context)
                            
                            do {
                                newBook.pdfData = try Data(contentsOf: pdfURL)
                            } catch {
                                print("PDF data loading error: \(error)")
                            }
                            
                            newBook.bookName = fileNameWithoutExtension

                            let bookImages = [
                                "books", "books2", "books3", "books4", "books5",
                                "books6", "books7", "books8", "books9", "books10"
                            ]
                            let randomIndex = Int.random(in: 0..<bookImages.count)
                            let selectedImage = bookImages[randomIndex]
                            newBook.bookImage = selectedImage

                            do {
                                try context.save()
                                let bookNew = Library(bookImage: UIImage(named: selectedImage), bookTitle: fileNameWithoutExtension, currentAndTotal: "0 / 0")
                                self.dataSource.append(bookNew)
                                self.tableView.reloadData()
                                self.showAlert(title: SuccessReadBook, message: SuccessfulySavgedReadBook)
                            } catch {
                                print("PDF saving error: \(error)")
                            }

                            DispatchQueue.main.async {
                                activityIndicator.stopAnimating()
                                activityIndicator.removeFromSuperview()
                            }
                        }
                    }
                } else {
                    print("No PDF file selected or an incorrect file was chosen.")
                }
            }
        }
    
    
    
    func fetchLibraryData() {
        let coreDataManager = CoreDataManager.shared
        let context = coreDataManager.context
        let fetchRequest: NSFetchRequest<DataOfLibrary> = DataOfLibrary.fetchRequest()
        
        do {
            let newBook = try context.fetch(fetchRequest)
            
            for book in newBook {
                guard let name = book.bookName, let imageName = book.bookImage else { continue }
                
                
                let newBook = Library(bookImage: UIImage(named: imageName),bookTitle: name, currentAndTotal: "")
                dataSource.append(newBook)
            }
            tableView.reloadData()
        } catch {
            print("Error retrieving book data.: \(error)")
        }
    }
}
