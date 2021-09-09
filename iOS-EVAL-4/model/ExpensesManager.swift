//
//  ExpensesManager.swift
//  iOS-EVAL-4
//
//  Created by Student06 on 09/09/2021.
//

import Foundation
import CoreData

class ExpensesManager {
    
    static let shared = ExpensesManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private lazy var managedObjectContext: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    func fillData() {
        
        let expenseCinema = Expense(context: managedObjectContext)
        
        expenseCinema.name = "Cinéma"
        expenseCinema.value = 12.0
        
        let expenseBoursin = Expense(context: managedObjectContext)
        
        expenseBoursin.name = "Boursin"
        expenseBoursin.value = 5.0
        
        let expensePain = Expense(context: managedObjectContext)
        
        expensePain.name = "Pain"
        expensePain.value = 2.0
        
        let expenseVin = Expense(context: managedObjectContext)
        
        expenseVin.name = "Vin"
        expenseVin.value = 12.0
        
        
        let expenseSection = ExpenseSection(context: managedObjectContext)
        
        expenseSection.name = "LOISIRS"
        expenseSection.addToExpenses(expenseCinema)
        
        let expenseSectionFood = ExpenseSection(context: managedObjectContext)
        
        expenseSectionFood.name = "NOURRITURE"
        expenseSectionFood.addToExpenses(expenseBoursin)
        expenseSectionFood.addToExpenses(expensePain)
        expenseSectionFood.addToExpenses(expenseVin)

        
        do {
            try managedObjectContext.save()
        } catch {
            print("Error", error)
            managedObjectContext.rollback()
        }
        UserDefaultManager.shared.dataFilled = true
    }
    
    func fetchData() -> [ExpenseSection] {
        
        let fetchRequest = NSFetchRequest<ExpenseSection>(entityName: "ExpenseSection")
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        do {
            let expenseSection = try managedObjectContext.fetch(fetchRequest)
            return expenseSection
        }catch {
            print("Could not fetch")
            return [ExpenseSection]()
        }
    }
    
}
