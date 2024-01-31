//
//  CoreDataManager.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 1/25/24.
//

import Foundation
import CoreData

class CoreDataManager {

    static let shared = CoreDataManager()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SpiritPath")
        guard let groupURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.spiritpathgroup") else {
            fatalError("Group URL could not be created")
        }
        let storeURL = groupURL.appendingPathComponent("SpiritPath.sqlite")
        let description = NSPersistentStoreDescription(url: storeURL)
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores(completionHandler: { (_, error) in
            guard error == nil else {
                fatalError("Error loading persistent store: \(error!)")
            }
        })
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // Entity: Bookmarks
    func createBookmarks(bookDescription: String, bookName: String, bookPage: Int) {
        let bookmarksEntity = NSEntityDescription.entity(forEntityName: "Bookmarks", in: context)!
        let bookmarksObject = NSManagedObject(entity: bookmarksEntity, insertInto: context)

        bookmarksObject.setValue(bookDescription, forKey: "bookDescription")
        bookmarksObject.setValue(bookName, forKey: "bookName")
        bookmarksObject.setValue(bookPage, forKey: "bookPage")

        saveContext()
    }

    // Entity: DataOfLibrary
    func createDataOfLibrary(bookImage: Data, bookName: String, pdfData: Data, pdfURL: String) {
        let dataOfLibraryEntity = NSEntityDescription.entity(forEntityName: "DataOfLibrary", in: context)!
        let dataOfLibraryObject = NSManagedObject(entity: dataOfLibraryEntity, insertInto: context)

        dataOfLibraryObject.setValue(bookImage, forKey: "bookImage")
        dataOfLibraryObject.setValue(bookName, forKey: "bookName")
        dataOfLibraryObject.setValue(pdfData, forKey: "pdfData")
        dataOfLibraryObject.setValue(pdfURL, forKey: "pdfURL")

        saveContext()
    }

    // Entity: DataOfWeek
    func createDataOfWeek(date: Date, dayOfWeek: String, totalValue: Int) {
        let dataOfWeekEntity = NSEntityDescription.entity(forEntityName: "DataOfWeek", in: context)!
        let dataOfWeekObject = NSManagedObject(entity: dataOfWeekEntity, insertInto: context)

        dataOfWeekObject.setValue(date, forKey: "date")
        dataOfWeekObject.setValue(dayOfWeek, forKey: "dayOfWeek")
        dataOfWeekObject.setValue(totalValue, forKey: "totalValue")

        saveContext()
    }

    // Entity: RoutineData
    func createRoutineData(category: String, date: Date, goal: Int, name: String, today: Int, total: Int) {
        let routineDataEntity = NSEntityDescription.entity(forEntityName: "RoutineData", in: context)!
        let routineDataObject = NSManagedObject(entity: routineDataEntity, insertInto: context)

        routineDataObject.setValue(category, forKey: "category")
        routineDataObject.setValue(date, forKey: "date")
        routineDataObject.setValue(goal, forKey: "goal")
        routineDataObject.setValue(name, forKey: "name")
        routineDataObject.setValue(today, forKey: "today")
        routineDataObject.setValue(total, forKey: "total")
        saveContext()
    }

    // Entity: SwitchValue
    func createSwitchValue(switchValue: Bool) {
        let switchValueEntity = NSEntityDescription.entity(forEntityName: "SwitchValue", in: context)!
        let switchValueObject = NSManagedObject(entity: switchValueEntity, insertInto: context)

        switchValueObject.setValue(switchValue, forKey: "switchValue")

        saveContext()
    }

    // Context'i kaydetme metodu
    private func saveContext() {
        do {
            try context.save()
        } catch {
            fatalError("Error saving context: \(error)")
        }
    }
    
    // Widget güncelleme metodu
    func updateWidgetNotification() {
        NotificationCenter.default.post(name: NSNotification.Name("WidgetDataChanged"), object: nil)
    }

}
